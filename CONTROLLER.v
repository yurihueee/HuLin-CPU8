`include "header.v"

module CONTROLLER(
  input wire [5 : 0] opcode,
  output reg [5 : 0] ctrlWord
);

always @(opcode) begin
  case(opcode[5:1])
     `ADD_OP :  ctrlWord = `ADD_CTRL ;
     `SUB_OP:   ctrlWord = `SUB_CTRL;
     `SLT_OP:   ctrlWord = `SLT_CTRL;
     `AND_OP:   ctrlWord = `AND_CTRL;
     `OR_OP:    ctrlWord = `OR_CTRL;
     `NOR_OP:   ctrlWord = `NOR_CTRL;
     `SLL_OP:   ctrlWord = `SLL_CTRL;
     `SRL_OP:   ctrlWord = `SRL_CTRL;
     `ADDI_OP:  ctrlWord = `ADDI_CTRL;
     `SLTI_OP:  ctrlWord = `SLTI_CTRL;
     `ANDI_OP:  ctrlWord = `ANDI_CTRL;
     `ORI_OP:   ctrlWord = `ORI_CTRL;
     `NORI_OP:  ctrlWord = `NORI_CTRL;
     `SLLI_OP:  ctrlWord = `SLLI_CTRL;
     `SRLI_OP:  ctrlWord = `SRLI_CTRL;
     `LOAD_OP:  ctrlWord = `LOAD_CTRL;
     `STORE_OP: ctrlWord = `STORE_CTRL;
     `BEQ_OP:   ctrlWord = `BEQ_CTRL;
     `BNE_OP:   ctrlWord = `BNE_CTRL;
	 `J_OP:     ctrlWord = (opcode[0]) ? `JUMP_CTRL : `HALT_CTRL;
	  default:   ctrlWord = 6'bxxxxxx;
	endcase
end

endmodule