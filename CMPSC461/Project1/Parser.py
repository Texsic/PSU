import re
from typing import List, Tuple, Any, Union
from ASTNodeDefs import *

# note for self: using this Union type alias from the template, seems useful
ExprType = Union[ASTNode, Tuple[str, Any]]

class Lexer:
    """
    Turns the code string into a list of tokens.
    """
    def __init__(self, code: str) -> None:
        self.code = code
        # A list of token regex patterns. Order matters here.
        self.token_specs = [
            ('NUMBER',     r'\d+'),
            ('IDENTIFIER', r'[A-Za-z_][A-Za-z0-9_]*'),
            ('PLUS',       r'\+'),
            ('MINUS',      r'-'),
            ('MULTIPLY',   r'\*'),
            ('DIVIDE',     r'/'),
            ('MODULO',     r'%'),
            ('EQ',         r'=='),
            ('NEQ',        r'!='),
            ('GREATER',    r'>'),
            ('LESS',       r'<'),
            ('EQUALS',     r'='),
            ('LPAREN',     r'\('),
            ('RPAREN',     r'\)'),
            ('COMMA',      r','),
            ('COLON',      r':'),
            ('SKIP',       r'[ \t\n]+'),  # ignore whitespace
            ('MISMATCH',   r'.'),
        ]
        self.token_regex = '|'.join(f'(?P<{name}>{regex})' for name, regex in self.token_specs)
        
        # Keywords need to be checked after finding an IDENTIFIER
        self.keywords = {
            'if': 'IF', 'else': 'ELSE', 'for': 'FOR', 'to': 'TO',
            'print': 'PRINT', 'and': 'AND', 'or': 'OR', 'not': 'NOT'
        }

    def tokenize(self) -> List[Tuple[str, Any]]:
        """
        Main function for the lexer. Goes through the code and generates tokens.
        """
        all_tokens = []
        for match in re.finditer(self.token_regex, self.code):
            kind = match.lastgroup
            value = match.group()

            if kind == 'NUMBER':
                all_tokens.append((kind, int(value)))
            elif kind == 'IDENTIFIER':
                #check if the identifier is actually a keyword
                token_kind = self.keywords.get(value, 'IDENTIFIER')
                all_tokens.append((token_kind, value))
            elif kind == 'SKIP':
                continue
            elif kind == 'MISMATCH':
                raise RuntimeError(f'Unexpected character: {value}')
            else:
                # anhy regular operator or symbol
                all_tokens.append((kind, value))
        
        all_tokens.append(('EOF', None))
        return all_tokens

class Parser:
    """
    Takes tokens from the Lexer and builds the Abstract Syntax Tree (AST).
    """
    def __init__(self, tokens: List[Tuple[str, Any]]) -> None:
        self.tokens = tokens
        self.token_idx = 0  # my current position in the token list

    def peek(self) -> Tuple[str, Any]:
        """Look at the current token without consuming it."""
        return self.tokens[self.token_idx]

    def consume(self) -> Tuple[str, Any]:
        """Consumes the current token and moves to the next one."""
        token = self.tokens[self.token_idx]
        self.token_idx += 1
        return token

    def expect(self, expected_kind: str) -> Tuple[str, Any]:
        """Consume the next token, but only if it's the right kind."""
        token = self.peek()
        if token[0] == expected_kind:
            return self.consume()
        else:
            raise SyntaxError(f"Expected {expected_kind} but got {token[0]}")

    def parse(self) -> List[ASTNode]:
        """Main parse function. A program is just a list of statements."""
        statements = []
        while self.peek()[0] != 'EOF':
            statements.append(self.parse_statement())
        return statements

    def parse_statement(self) -> ASTNode:
        """Figure out what kind of statement we have."""
        token_kind = self.peek()[0]

        if token_kind == 'IF':
            return self.parse_if_stmt()
        if token_kind == 'FOR':
            return self.parse_for_stmt()
        if token_kind == 'PRINT':
            return self.parse_print_stmt()
        if token_kind == 'IDENTIFIER':
            # This must be an assignment
            var_name = self.expect('IDENTIFIER')
            self.expect('EQUALS')
            val = self.parse_expression()
            return Assignment(var_name, val)
        
        raise SyntaxError(f"Invalid start of statement: {token_kind}")

    def parse_if_stmt(self) -> IfStatement:
        self.expect('IF')
        condition = self.parse_boolean_expression()
        self.expect('COLON')
        then_block = self.parse_block()
        
        #check for the optional else part
        else_block = None
        if self.peek()[0] == 'ELSE':
            self.expect('ELSE')
            self.expect('COLON')
            else_block = self.parse_block()
            
        return IfStatement(condition, then_block, else_block)

    def parse_for_stmt(self) -> ForStatement:
        self.expect('FOR')
        iterator_var = self.expect('IDENTIFIER')
        self.expect('EQUALS')
        start_val = self.parse_expression()
        self.expect('TO')
        end_val = self.parse_expression()
        self.expect('COLON')
        body = self.parse_block()
        return ForStatement(iterator_var, start_val, end_val, body)

    def parse_print_stmt(self) -> PrintStatement:
        self.expect('PRINT')
        self.expect('LPAREN')
        args = self.parse_arg_list()
        self.expect('RPAREN')
        return PrintStatement(args)

    def parse_block(self) -> Block:
        # the grammar says "statement*". The * means "zero or more".
        #it stops when it sees 'ELSE' (ending an 'if' block) or 'EOF'.
        statements = []
        while self.peek()[0] not in ['EOF', 'ELSE']:
            statements.append(self.parse_statement())
             
        return Block(statements)

    def parse_arg_list(self) -> List[ExprType]:
        args = []
        if self.peek()[0] != 'RPAREN':
            args.append(self.parse_expression())
            while self.peek()[0] == 'COMMA':
                self.consume() # consume the comma
                args.append(self.parse_expression())
        return args

    # The next functions handle expression parsing with operator precedence
    # the order of functions is important: lowest precedence is called first.
    
    def parse_boolean_expression(self) -> ExprType: #handles 'or'
        node = self.parse_boolean_term()
        while self.peek()[0] == 'OR':
            op = self.consume()
            right = self.parse_boolean_term()
            node = LogicalOperation(node, op, right)
        return node

    def parse_boolean_term(self) -> ExprType: # handles 'and'
        node = self.parse_boolean_factor()
        while self.peek()[0] == 'AND':
            op = self.consume()
            right = self.parse_boolean_factor()
            node = LogicalOperation(node, op, right)
        return node

    def parse_boolean_factor(self) -> ExprType: #andles 'not'
        if self.peek()[0] == 'NOT':
            op = self.consume()
            operand = self.parse_boolean_factor()
            return UnaryOperation(op, operand)
        return self.parse_comparison()

    def parse_comparison(self) -> ExprType: #Handles ==, !=, < >
        left_expr = self.parse_expression()
        token_kind = self.peek()[0]
        if token_kind == 'EQ' or token_kind == 'NEQ' or token_kind == 'LESS' or token_kind == 'GREATER':
            op = self.consume()
            right_expr = self.parse_expression()
            return BinaryOperation(left_expr, op, right_expr)
        return left_expr

    def parse_expression(self) -> ExprType: # This handles +,-
        node = self.parse_term()
        while self.peek()[0] == 'PLUS' or self.peek()[0] == 'MINUS':
            op = self.consume()
            right_term = self.parse_term()
            node = BinaryOperation(node, op, right_term)
        return node

    def parse_term(self) -> ExprType: # this handles *, /, %
        node = self.parse_factor()
        while self.peek()[0] == 'MULTIPLY' or self.peek()[0] == 'DIVIDE' or self.peek()[0] == 'MODULO':
            op = self.consume()
            right_factor = self.parse_factor()
            node = BinaryOperation(node, op, right_factor)
        return node

    def parse_factor(self) -> ExprType: # handles unary + or -
        token = self.peek()
        if token[0] == 'PLUS' or token[0] == 'MINUS':
            op = self.consume()
            factor = self.parse_factor()
            return UnaryOperation(op, factor)
        return self.parse_primary()

    def parse_primary(self) -> ExprType: # Handles numbers, identifiers,and ( )
        token = self.peek()
        if token[0] == 'NUMBER':
            return self.consume()
        elif token[0] == 'IDENTIFIER':
            return self.consume()
        elif token[0] == 'LPAREN':
            self.consume() # consume '('
            expr = self.parse_boolean_expression()
            self.expect('RPAREN') # make sure it's closed
            return expr
        else:
            raise SyntaxError(f"Unexpected token {token[0]} found in expression")
