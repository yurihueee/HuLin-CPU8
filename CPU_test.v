`timescale  1ns/1ns

module CPU_test();
  reg clk;
  reg rst_n;
  
CPU    CPU_inst0(clk, rst_n);

initial begin
  clk = 1'b1;
  rst_n = 1'b0;
  #2 rst_n = 1'b1;
end

always begin
  #5 clk = ~clk;
end
  
endmodule