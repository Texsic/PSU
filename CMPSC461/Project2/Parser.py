import re
from typing import List, Tuple, Any, Union
from ASTNodeDefs import *

ExprType = Union[ASTNode, Tuple[str, Any]]
DataType = str

class Lexer:
    def __init__(self, code: str) -> None:
        self.code = code
        self.tokens: List[Tuple[str, Any]] = []
        
        # defined tokens rder matters
        self.token_specs = [
            ("HEXNUMBER", r"0x[0-9a-f]+"),
            ("NUMBER", r"\d+"),
            ("BOOL", r"\b(True|False)\b"),
            ("TYPE", r"\b(int|hex|bool)\b"),
            ("ENDIF", r"\bendif\b"),
            ("ENDFOR", r"\bendfor\b"),
            ("IF", r"\bif\b"),
            ("ELSE", r"\belse\b"),
            ("FOR", r"\bfor\b"),
            ("TO", r"\bto\b"),
            ("PRINT", r"\bprint\b"),
            ("AND", r"\band\b"),
            ("OR", r"\bor\b"),
            ("NOT", r"\bnot\b"),
            ("PLUS", r"\+"),
            ("MINUS", r"-"),
            ("MULTIPLY", r"\*"),
            ("DIVIDE", r"/"),
            ("MODULO", r"%"),
            ("EQ", r"=="),
            ("NEQ", r"!="),
            ("GREATER", r">"),
            ("LESS", r"<"),
            ("EQUALS", r"="),
            ("LPAREN", r"\("),
            ("RPAREN", r"\)"),
            ("COMMA", r","),
            ("COLON", r":"),
            ("IDENTIFIER", r"[A-Za-z_][A-Za-z0-9_]*"),
            ("SKIP", r"[ \t\n]+"),
            ("MISMATCH", r"."),
        ]
        self.token_regex = "|".join(
            f"(?P<{name}>{regex})" for name, regex in self.token_specs
        )

    def tokenize(self) -> List[Tuple[str, Any]]:
        for mo in re.finditer(self.token_regex, self.code):
            kind = mo.lastgroup
            value = mo.group()
            if kind == "NUMBER":
                value = int(value)
            elif kind == "SKIP":
                continue
            elif kind == "MISMATCH":
                raise RuntimeError(f"Unexpected char: {value}")
            #treat hex and bool as strings for AST, int as int
            self.tokens.append((kind, value))
        self.tokens.append(("EOF", None))
        return self.tokens


class Parser:
    def __init__(self, tokens: List[Tuple[str, Any]]) -> None:
        self.tokens = tokens
        self.pos = 0
        #symbol table structure: dict of scopes
        self.symbol_table = {"global": {}}
        self.scope_counter = 0
        self.scope_stack = ["global"]
        self.messages = []

    def current_token(self) -> Tuple[str, Any]:
        return self.tokens[self.pos]

    def advance(self) -> None:
        self.pos += 1

    def expect(self, kind: str) -> Tuple[str, Any]:
        if self.current_token()[0] == kind:
            token = self.current_token()
            self.advance()
            return token
        else:
            raise SyntaxError(f"Expected {kind} but got {self.current_token()[0]}")

    def error(self, message: str) -> None:
        self.messages.append(message)

    def parse(self) -> List[ASTNode]:
        statements = []
        while self.current_token()[0] != "EOF":
            statements.append(self.parse_statement())
        return statements

    def parse_statement(self) -> ASTNode:
        kind = self.current_token()[0]
        if kind == "IDENTIFIER":
            return self.parse_assign_stmt()
        elif kind == "TYPE":
            return self.parse_decl_stmt()
        elif kind == "IF":
            return self.parse_if_stmt()
        elif kind == "FOR":
            return self.parse_for_stmt()
        elif kind == "PRINT":
            return self.parse_print_stmt()
        else:
            # helps debuging
            raise SyntaxError(f"Unexpected token at start of statement: {kind}")

    def parse_decl_stmt(self) -> Declaration:
        # rule: type IDENTIFIER
        t_token = self.expect("TYPE")
        var_type = t_token[1]
        
        id_token = self.expect("IDENTIFIER")
        var_name = id_token[1]
        
        # check for redeclaration in current scope
        if self.checkVarRedeclared(var_name):
            self.checkVarRedeclaredErrorMsg(var_name)
        else:
            self.add_variable(var_name, var_type)
            
        return Declaration(t_token, id_token)

    def parse_assign_stmt(self) -> Assignment:
        # rul IDENTIFIER = expre
        id_token = self.expect("IDENTIFIER")
        var_name = id_token[1]
        
        self.expect("EQUALS")
        expr_node, expr_type = self.parse_expression()
        
        # check declaration
        decl_type = self.checkVarDeclared(var_name)
        if decl_type is None:
            self.checkVarDeclaredErrorMsg(var_name)
            decl_type = "error" # stop further errors
            
        # check type match (rule 4)
        if decl_type != "error" and expr_type != "error":
            if decl_type != expr_type:
                self.checkAssignErrorMsg(var_name, decl_type, expr_type)
        
        return Assignment(id_token, expr_node)

    def parse_if_stmt(self) -> IfStatement:
        # rule: if bool_expr : block (else : block)? endif
        self.expect("IF")
        cond_node, cond_type = self.parse_boolean_expression()
        
        #rule 5: condition must be bool
        if cond_type != "bool" and cond_type != "error":
            self.checkBoolOpErrorMsg()
            
        self.expect("COLON")
        
        # block scoping
        self.enter_scope()
        then_block = self.parse_block()
        self.exit_scope()
        
        else_block = None
        if self.current_token()[0] == "ELSE":
            self.advance() # eat ELSE
            self.expect("COLON")
            self.enter_scope()
            else_block = self.parse_block()
            self.exit_scope()
            
        self.expect("ENDIF")
        return IfStatement(cond_node, then_block, else_block)

    def parse_for_stmt(self) -> ForStatement:
        # rule: forID = expr to expr: block endfor
        self.expect("FOR")
        iter_token = self.expect("IDENTIFIER")
        iter_name = iter_token[1]
        
        # iterator must be declared
        iter_type = self.checkVarDeclared(iter_name)
        if iter_type is None:
            self.checkVarDeclaredErrorMsg(iter_name)
            iter_type = "error"

        self.expect("EQUALS")
        start_node, start_type = self.parse_expression()
        
        if iter_type != "error" and start_type != "error":
            if iter_type != start_type:
                self.checkAssignErrorMsg(iter_name, iter_type, start_type)

        self.expect("TO")
        end_node, end_type = self.parse_expression()
        
        # note: instructions say for loops allow different types in conditions
        # so we don't enforce strict matching between start/endhere
        
        self.expect("COLON")
        
        self.enter_scope()
        block_node = self.parse_block()
        self.exit_scope()
        
        self.expect("ENDFOR")
        return ForStatement(iter_token, start_node, end_node, block_node)

    def parse_print_stmt(self) -> PrintStatement:
        self.expect("PRINT")
        self.expect("LPAREN")
        args = []
        if self.current_token()[0] != "RPAREN":
            args = self.parse_arg_list()
        self.expect("RPAREN")
        return PrintStatement(args)

    def parse_block(self) -> Block:
        stmts = []
        # read until block enders
        while self.current_token()[0] not in ["ELSE", "ENDIF", "ENDFOR", "EOF"]:
            stmts.append(self.parse_statement())
        return Block(stmts)

    def parse_arg_list(self) -> List[ExprType]:
        # returns list of expression nodes(ignoring types for print)
        node, _ = self.parse_expression()
        args = [node]
        while self.current_token()[0] == "COMMA":
            self.advance()
            n, _ = self.parse_expression()
            args.append(n)
        return args

    def parse_boolean_expression(self) -> Tuple[ExprType, DataType]:
        #handles OR
        left_node, left_type = self.parse_boolean_term()
        
        while self.current_token()[0] == "OR":
            op = self.current_token()
            self.advance()
            right_node, right_type = self.parse_boolean_term()
            left_node = LogicalOperation(left_node, op, right_node)
            
            # rule 1: both bool
            if left_type != "error" and right_type != "error":
                if left_type == "bool" and right_type == "bool":
                    left_type = "bool"
                else:
                    self.checkBoolOpErrorMsg()
                    left_type = "error"
            else:
                left_type = "error"
                
        return left_node, left_type

    def parse_boolean_term(self) -> Tuple[ExprType, DataType]:
        # handles AND
        left_node, left_type = self.parse_boolean_factor()
        
        while self.current_token()[0] == "AND":
            op = self.current_token()
            self.advance()
            right_node, right_type = self.parse_boolean_factor()
            left_node = LogicalOperation(left_node, op, right_node)
            
            # rule 1 again
            if left_type != "error" and right_type != "error":
                if left_type == "bool" and right_type == "bool":
                    left_type = "bool"
                else:
                    self.checkBoolOpErrorMsg()
                    left_type = "error"
            else:
                left_type = "error"
                
        return left_node, left_type

    def parse_boolean_factor(self) -> Tuple[ExprType, DataType]:
        #handles NOT
        if self.current_token()[0] == "NOT":
            op = self.current_token()
            self.advance()
            operand, op_type = self.parse_boolean_factor()
            
            if op_type == "bool":
                return UnaryOperation(op, operand), "bool"
            elif op_type == "error":
                return UnaryOperation(op, operand), "error"
            else:
                self.checkBoolOpErrorMsg()
                return UnaryOperation(op, operand), "error"
            
        return self.parse_comparison()

    def parse_comparison(self) -> Tuple[ExprType, DataType]:
        # handles ==, < >, !=
        left_node, left_type = self.parse_expression()
        
        # support chaining if grammar implies it, though usualy binary
        while self.current_token()[0] in ["EQ", "NEQ", "LESS", "GREATER"]:
            op = self.current_token()
            self.advance()
            right_node, right_type = self.parse_expression()
            left_node = BinaryOperation(left_node, op, right_node)
            
            #rule 3: same types, output is bool
            if left_type != "error" and right_type != "error":
                if left_type == right_type:
                    left_type = "bool"
                else:
                    self.checkTypeMatchErrorMsg(left_type, right_type)
                    left_type = "error"
            else:
                left_type = "error"
                
        return left_node, left_type

    def parse_expression(self) -> Tuple[ExprType, DataType]:
        # handles + -
        left_node, left_type = self.parse_term()
        
        while self.current_token()[0] in ["PLUS", "MINUS"]:
            op = self.current_token()
            self.advance()
            right_node, right_type = self.parse_term()
            left_node = BinaryOperation(left_node, op, right_node)
            
            # rule 2: int or hex,must match
            if left_type != "error" and right_type != "error":
                if left_type not in ["int", "hex"] or right_type not in ["int", "hex"]:
                    self.checkArithOpErrorMsg()
                    left_type = "error"
                elif left_type != right_type:
                    self.checkTypeMatchErrorMsg(left_type, right_type)
                    left_type = "error"
                else:
                    left_type = left_type # preserves type
            else:
                left_type = "error"
                
        return left_node, left_type

    def parse_term(self) -> Tuple[ExprType, DataType]:
        # andles *, /, %
        left_node, left_type = self.parse_factor()
        
        while self.current_token()[0] in ["MULTIPLY", "DIVIDE", "MODULO"]:
            op = self.current_token()
            self.advance()
            right_node, right_type = self.parse_factor()
            left_node = BinaryOperation(left_node, op, right_node)
            
            # rule 2 again
            if left_type != "error" and right_type != "error":
                if left_type not in ["int", "hex"] or right_type not in ["int", "hex"]:
                    self.checkArithOpErrorMsg()
                    left_type = "error"
                elif left_type != right_type:
                    self.checkTypeMatchErrorMsg(left_type, right_type)
                    left_type = "error"
                else:
                    left_type = left_type
            else:
                left_type = "error"
                
        return left_node, left_type

    def parse_factor(self) -> Tuple[ExprType, DataType]:
        # handles unary +, -
        if self.current_token()[0] in ["PLUS", "MINUS"]:
            op = self.current_token()
            self.advance()
            operand, op_type = self.parse_factor()
            
            if op_type != "error":
                if op_type not in ["int", "hex"]:
                    self.checkArithOpErrorMsg()
                    return UnaryOperation(op, operand), "error"
            
            return UnaryOperation(op, operand), op_type
            
        return self.parse_primary()

    def parse_primary(self) -> Tuple[ExprType, DataType]:
        t = self.current_token()
        kind = t[0]
        
        if kind == "NUMBER":
            self.advance()
            return t, "int"
        elif kind == "HEXNUMBER":
            self.advance()
            return t, "hex"
        elif kind == "BOOL":
            self.advance()
            return t, "bool"
        elif kind == "IDENTIFIER":
            self.advance()
            var_name = t[1]
            var_type = self.checkVarDeclared(var_name)
            if var_type is None:
                self.checkVarDeclaredErrorMsg(var_name)
                return t, "error"
            return t, var_type
        elif kind == "LPAREN":
            self.advance()
            node, n_type = self.parse_boolean_expression()
            self.expect("RPAREN")
            return node, n_type
        else:
            raise SyntaxError(f"Bad primary expr at {t}")

    def enter_scope(self) -> None:
        self.scope_counter += 1
        name = f"scope_{self.scope_counter}"
        self.symbol_table[name] = {}
        self.scope_stack.append(name)

    def exit_scope(self) -> None:
        if len(self.scope_stack) > 1:
            self.scope_stack.pop()

    def checkVarRedeclared(self, identifier: str) -> bool:
        curr_scope = self.scope_stack[-1]
        return identifier in self.symbol_table[curr_scope]

    def checkVarRedeclaredErrorMsg(self, identifier: str) -> None:
        self.error(
            f"Variable {identifier} has already been declared in the current scope\n"
        )

    def checkVarDeclared(self, identifier: str) -> Union[str, None]:
        # check stack from top 2 bottom
        for s in reversed(self.scope_stack):
            if identifier in self.symbol_table[s]:
                return self.symbol_table[s][identifier]
        return None

    def checkVarDeclaredErrorMsg(self, identifier: str) -> None:
        self.error(
            f"Variable {identifier} has not been declared in the current or any enclosing scopes\n"
        )

    def checkBoolOpErrorMsg(self) -> None:
        self.error(
            f"Non-boolean expression used in boolean operation or if condition\n"
        )

    def checkArithOpErrorMsg(self) -> None:
        self.error(f"Invalid input types in arithmetic operation\n")

    def checkTypeMatchErrorMsg(self, type1: str, type2: str) -> None:
        self.error(f"Type mismatch detected between {type1} and {type2}\n")

    def checkAssignErrorMsg(
        self, identifier: str, var_type: str, expr_type: str
    ) -> None:
        self.error(
            f"Type mismatch detected in assignment to variable {identifier} of type {var_type} with expression of type {expr_type}\n"
        )

    def add_variable(self, name: str, var_type: str) -> None:
        curr = self.scope_stack[-1]
        self.symbol_table[curr][name] = var_type

    def get_variable_type(self, name: str) -> str:
        return self.checkVarDeclared(name)
