module RegisterFile(
  input  wire          clk,
  input  wire          rst_n,
  input  wire          enW,
  input  wire [2 : 0]  addrA,
  input  wire [2 : 0]  addrB,
  input  wire [2 : 0]  addrW,
  input  wire [7 : 0] dataW,
  output wire [7 : 0] readA,
  output wire [7 : 0] readB
);

reg [7 : 0] mem[0:7]; //FF
integer i;

always @(negedge clk, negedge rst_n) begin
  if(~rst_n) begin
    for(i = 0; i < 8; i = i + 1) begin
      mem[i] <= 8'b0;
    end
  end else begin
    if(enW)
      mem[addrW] <= dataW;
  end
end

assign readA = mem[addrA];
assign readB = mem[addrB];

endmodule