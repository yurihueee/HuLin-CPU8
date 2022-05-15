`include "header.v"

module ALU(
  input wire         [2  : 0] aluCtrl,
  input wire signed  [7 : 0] operandA,
  input wire signed  [7 : 0] operandB,
  output reg signed  [7 : 0] result,
  output wire                 zeroFlag
);

always @(aluCtrl, operandA, operandB) begin
  case(aluCtrl)
     `ADD_ALU: result = {operandA + operandB};
     `SUB_ALU: result = {operandA + ~operandB + 7'b1};
     `SLT_ALU: result = (operandA < operandB) ? 7'b1 : 7'b0;
     `AND_ALU: result = operandA & operandB;
     `OR_ALU:  result = operandA | operandB;
     `NOR_ALU: result = ~(operandA | operandB);
     `SLL_ALU: result = operandA << operandB[3:0];
     `SRL_ALU: result = operandA >> operandB[3:0];
     default:  result = 8'bxxxxxxxx;
  endcase
end

assign zeroFlag = ~(|result);

endmodule