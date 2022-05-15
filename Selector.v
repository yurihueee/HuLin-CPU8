module Selector #(parameter WIDTH = 8)
(
  input wire          select,
  input wire  [WIDTH-1 : 0] dataA,
  input wire  [WIDTH-1 : 0] dataB,
  output wire [WIDTH-1 : 0] read
);

assign read = (select) ? dataB : dataA;

endmodule