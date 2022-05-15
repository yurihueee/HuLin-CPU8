`include "header.v"

module ALUCrtl(
  input wire  [4 : 0] opcode,
  output reg [2 : 0] aluCtrl
);

always @(opcode) begin
  case(opcode)
     `ADD_OP: aluCtrl   = `ADD_ALU;
     `SUB_OP: aluCtrl   = `SUB_ALU;
     `SLT_OP: aluCtrl   = `SLT_ALU;
     `AND_OP: aluCtrl   = `AND_ALU;
     `OR_OP:  aluCtrl   = `OR_ALU;
     `NOR_OP: aluCtrl   = `NOR_ALU;
     `SLL_OP: aluCtrl   = `SLL_ALU;
     `SRL_OP: aluCtrl   = `SRL_ALU;
     `ADDI_OP: aluCtrl  = `ADD_ALU;
     `SLTI_OP: aluCtrl  = `SLT_ALU;
     `ANDI_OP: aluCtrl  = `AND_ALU;
     `ORI_OP:  aluCtrl  = `OR_ALU;
     `NORI_OP: aluCtrl  = `NOR_ALU;
     `SLLI_OP: aluCtrl  = `SLL_ALU;
     `SRLI_OP: aluCtrl  = `SRL_ALU;
     `LOAD_OP: aluCtrl  = `ADD_ALU;
     `STORE_OP: aluCtrl = `ADD_ALU;
     `BEQ_OP: aluCtrl   = `SUB_ALU;
     `BNE_OP: aluCtrl   = `SUB_ALU;
	 `J_OP: aluCtrl     =  `SUB_ALU;
     default: aluCtrl   = 3'bxxx;
  endcase
end

endmodule