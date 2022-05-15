module PC(
  input wire          clk,
  input wire          rst_n,
  input wire          enW,
  input wire [7 : 0] writeD,
  output reg [7 : 0] readD
);

always @(posedge clk, negedge rst_n) begin
  if(~rst_n) begin
    readD <= 8'b0;
  end else begin
    if(enW)
      readD <= writeD;
  end
end

endmodule