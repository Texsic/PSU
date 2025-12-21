`timescale 1ns / 1ps

module ControlUnit( 
    //inputs
    input [5:0] op, func,
    
    //final project inputs
    input [4:0] rs, rt, mrn, ern,
    input mm2reg, mwreg, em2reg, ewreg,
    
    //Extra Credit Input
    input rsrtequ,
    
    //outputs
    output reg wreg, m2reg, wmem, aluimm, regrt,
    output reg [3:0] aluc,
    
    //final project outputs
    output reg [1:0] fwda, fwdb,
    output reg wpcir,
    
    //Extra Credit Outputs
    output reg sext, shift, jal, 
    output reg [1:0] pcsrc
    );

    reg regUsage = 1'b1;
    
    initial begin  
        wreg <= 0;
        m2reg <= 0; 
        wmem <= 0;
        aluimm <= 0;
        regrt <= 0;
        pcsrc <= 2'b00;
    end  
    
    // Combined Always Block to prevent Multiple Driver Errors
    always @ (*) begin 
        // 1. DEFAULT VALUES (Prevent Latches)
        wreg = 0; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0;
        aluc = 4'b0000; sext = 0; shift = 0; jal = 0; pcsrc = 0;
        wpcir = 1; fwda = 0; fwdb = 0; // Default: No stall, No forward

        // 2. INSTRUCTION DECODE LOGIC
        case (op) 
            6'b000000: // R-type instructions
            begin
                case (func) 
                    6'b100000: begin // ADD
                        aluc = 4'b0010; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 0; pcsrc = 2'b00;
                    end
                    6'b100010: begin // SUB
                        aluc = 4'b0110; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 0; pcsrc = 2'b00;                        
                    end 
                    6'b100100: begin // AND
                        aluc = 4'b0000; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 0; pcsrc = 2'b00;
                    end
                    6'b100101: begin // OR
                        aluc = 4'b0001; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 0; pcsrc = 2'b00;
                    end 
                    6'b100110: begin // XOR
                        aluc = 4'b0011; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 0; pcsrc = 2'b00;
                    end
                    6'b000000: begin // sll
                        aluc = 4'b0111; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 1; pcsrc = 2'b00;
                    end
                    6'b000010: begin // srl
                        aluc = 4'b1110; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 1; pcsrc = 2'b00;
                    end
                    6'b000011: begin // sra 
                        aluc = 4'b1001; wreg = 1; m2reg = 0; wmem = 0; aluimm = 0; regrt = 0; sext = 1'bx; jal = 0; shift = 1; pcsrc = 2'b00;
                    end
                    6'b001000: begin // jr
                        aluc = 4'bxxxx; wreg = 0; wmem = 0; aluimm = 1'bx; regrt = 1'bx; sext = 1'bx; jal = 1'bx; shift = 1'bx; pcsrc = 2'b10;
                    end  
                endcase
            end
            
            6'b001000: // addi
            begin
                wreg = 1; regrt = 1; jal = 0; m2reg = 0; shift = 0; aluimm = 1; sext = 1; aluc = 4'b0010; wmem = 0; pcsrc = 2'b00;
            end
            6'b001100: // andi 
            begin
                wreg = 1; regrt = 1; jal = 0; m2reg = 0; shift = 0; aluimm = 1; sext = 0; aluc = 4'b0000; wmem = 0; pcsrc = 2'b00;
            end
            6'b001101: // ori
            begin
                wreg = 1; regrt = 1; jal = 0; m2reg = 0; shift = 0; aluimm = 1; sext = 0; aluc = 4'b0001; wmem = 0; pcsrc = 2'b00;
            end
            6'b001110: // xori
            begin
                wreg = 1; regrt = 1; jal = 0; m2reg = 0; shift = 0; aluimm = 1; sext = 0; aluc = 4'b0011; wmem = 0; pcsrc = 2'b00;
            end          
            6'b100011: // LW
            begin
                wreg = 1; m2reg = 1; wmem = 0; aluc = 4'b0010; aluimm = 1; regrt = 1; jal = 0; shift = 0; pcsrc = 2'b00; sext = 1;
            end
            6'b101011: // SW
            begin
                wreg = 0; m2reg = 0; wmem = 1; aluc = 4'b0010; aluimm = 1; regrt = 1'bx; jal = 0; shift = 0; pcsrc = 2'b00; sext = 1;
            end
            6'b000100: // BEQ
            begin
                wreg = 0; wmem = 0; aluc = 4'b0011; aluimm = 0; regrt = 1'bx; jal = 1'bx; shift = 0; sext = 1;
                if (rsrtequ == 1) pcsrc = 2'b01; else pcsrc = 2'b00;
            end 
            6'b000101: // BNE
            begin
                wreg = 0; wmem = 0; aluc = 4'b0011; aluimm = 0; regrt = 1'bx; jal = 1'bx; shift = 0; sext = 1;
                if (rsrtequ == 0) pcsrc = 2'b01; else pcsrc = 2'b00; // FIXED: Branch if NOT equal (0)
            end  
            6'b001111: // lui
            begin
                wreg = 1; regrt = 1; jal = 0; m2reg = 0; shift = 1'bx; aluimm = 1; sext = 1'bx; aluc = 4'b0100; wmem = 0; pcsrc = 2'b00;
            end
            6'b000010: // j
            begin
                wreg = 0; regrt = 1'bx; jal = 1'bx; m2reg = 1'bx; shift = 1'bx; aluimm = 1'bx; sext = 1'bx; aluc = 4'bxxxx; wmem = 0; pcsrc = 2'b11;
            end
            6'b000011: // jal
            begin
                wreg = 1; regrt = 1'bx; jal = 1; shift = 1'bx; aluimm = 1'bx; sext = 1'bx; aluc = 4'bxxxx; wmem = 0; pcsrc = 2'b11;
            end          
        endcase

        // 3. STALL LOGIC (Overrides decoding if stall condition is met)
        // This ensures wreg and wmem are driven by a single block.
        if ((ewreg == 1'b1) && (em2reg == 1'b1) && (ern != 5'b0) && (regUsage == 1'b1) && ((ern == rs) || (ern == rt))) 
        begin
            wreg = 1'b0;
            wmem = 1'b0;
            wpcir = 1'b0; // STALL: Do not update PC
        end 
        else begin
            wpcir = 1'b1; // Normal operation
        end

        // 4. FORWARDING LOGIC
        // Forward A
        if ((ewreg == 1'b1) && (ern != 5'b0) && (ern == rs) && (em2reg == 1'b0)) begin
            fwda = 2'b01;
        end
        else if ((mwreg == 1'b1) && (mrn != 5'b0) && (mrn == rs) && (mm2reg == 1'b0)) begin
            fwda = 2'b10;
        end
        else if ((mwreg == 1'b1) && (mrn != 5'b0) && (mrn == rs) && (mm2reg == 1'b1)) begin
            fwda = 2'b11;
        end
        else begin
            fwda = 2'b00;
        end

        // Forward B
        if ((ewreg == 1'b1) && (ern != 5'b0) && (ern == rt) && (em2reg == 1'b0)) begin
            fwdb = 2'b01;
        end
        else if ((mwreg == 1'b1) && (mrn != 5'b0) && (mrn == rt) && (mm2reg == 1'b0)) begin
            fwdb = 2'b10;
        end
        else if ((mwreg == 1'b1) && (mrn != 5'b0) && (mrn == rt) && (mm2reg == 1'b1)) begin
            fwdb = 2'b11;
        end
        else begin
            fwdb = 2'b00;
        end
    end
endmodule