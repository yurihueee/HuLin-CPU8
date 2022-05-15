module CPU(
  input wire clk,
  input wire rst_n
);

wire [5:0] opcode;
wire [5:0] ctrlWord;

DATAPATH    DATAPATH_inst0(
                           .clk(clk),
                           .rst_n(rst_n),
									         .opcode(opcode),
									         .ctrlWord(ctrlWord)
                           );
CONTROLLER  CONTROLLER_inst0(
                             .opcode(opcode),
                             .ctrlWord(ctrlWord)
                             );

endmodule