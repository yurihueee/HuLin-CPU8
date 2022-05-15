`include "header.v"

module BranchCtrl(
  input wire       zeroFlag,
  input wire [5:0] opcode,
  output wire      branch
);

assign branch = (((opcode[5:1] == `BEQ_OP) | (opcode == 6'b000001)) & zeroFlag | (opcode == `BNE_OP) & ~zeroFlag ) ? 1'b1 : 1'b0;
  
endmodule