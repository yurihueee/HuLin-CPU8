module Memory(
  input wire           clk,
  input wire           enW,
  input wire [7 : 0]  addrI,
  input wire [7 : 0]  addrD,
  input wire [7 : 0]  dataW,
  output wire [17 : 0] readI,
  output wire [7 : 0] readD
);

reg [17 : 0] mem[0:63]; //FF
initial begin
    $readmemb("execution.bin", mem);
end

always @(negedge clk) begin
  if(enW)
    mem[addrD] <= dataW;
end

assign readI = mem[addrI];

wire [17:0] readDtemp;
assign readDtemp = mem[addrD];
assign readD = readDtemp[7:0];

endmodule