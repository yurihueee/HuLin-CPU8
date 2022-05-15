module DATAPATH(
  input wire clk,
  input wire rst_n,
  input wire  [5 : 0] ctrlWord,
  output wire [5 : 0] opcode
);

wire [17:0] instruction;
wire [7:0] signExtend;
wire [7:0] PCnext;
wire [7:0] PCnormal;
wire [7:0] constExt;
wire [7:0] readI;
wire [7:0] addrI;
wire [7:0] rALU;
wire [7:0] wDataM;
wire [7:0] rDataM;
wire [7:0] wDataR;
wire [7:0] readA;
wire [7:0] readB;
wire [7:0] operandB;

wire [2:0] addrWR;

wire [2:0] aluCtrl;

wire PCsrc, halt, regSrc, enWR, aluSrc, enWD, wrSrc;
wire zeroFlag;

assign {halt, regSrc, enWR, aluSrc, enWD, wrSrc} = ctrlWord;

assign PCnormal = addrI + 8'b1;

assign opcode = instruction[17:12];

BranchCtrl   BranchCtrl_inst0(
                              .zeroFlag(zeroFlag),
                              .opcode(instruction[17:12]),
                              .branch(PCsrc)
                             );

Selector     Selector_inst2(
                            .select(PCsrc),
							.dataA(PCnormal),
							.dataB(constExt),
							.read(PCnext)
                           );

PC           PC_inst0(
                       .clk(clk),
                       .rst_n(rst_n),
						.enW(~halt),
						.writeD(PCnext),
						.readD(addrI)
                     );
Memory       Memory_inst0(
                          .clk(clk),
                          .enW(enWD),
								  .addrI(addrI),
								  .addrD(rALU),
								  .dataW(readB),
								  .readI(instruction),
								  .readD(rDataM)
                         );

Selector     #(.WIDTH(3)) Selector_inst0(
                            .select(regSrc),
									          .dataA(instruction[9:7]),
									          .dataB(instruction[6:4]),
									          .read(addrWR)
                           );
								 
RegisterFile RegisterFile_inst0(
                                .clk(clk),
                                .rst_n(rst_n),
							           .enW(enWR),
							           .addrA(instruction[12:10]),
							           .addrB(instruction[9:7]),
										  .addrW(addrWR),
										  .dataW(wDataR),
										  .readA(readA),
										  .readB(readB)
                               );

SignedExtend   SignExtend_inst0(
                              .constin(instruction[6:0]),
                              .constExt(constExt)
                             );
									  
ALUCrtl      ALUCrtl_inst0(
                           .opcode(instruction[17:13]),
							.aluCtrl(aluCtrl)
                          );

Selector     Selector_inst3(
                            .select(aluSrc),
									 .dataA(readB),
									 .dataB(constExt),
									 .read(operandB)
                           );
								  
ALU          ALU_inst0(
                       .aluCtrl(aluCtrl),
							  .operandA(readA),
							  .operandB(operandB),
							  .result(rALU),
							  .zeroFlag(zeroFlag)
                      );

Selector     Selector_inst1(
                            .select(wrSrc),
									 .dataA(rDataM),
									 .dataB(rALU),
									 .read(wDataR)
                           );
							 
endmodule