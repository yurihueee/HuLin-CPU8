module SignedExtend(
  input wire  [6  : 0] constin,
  output wire [7 : 0]  constExt
);

assign constExt = {{2{constin[6]}}, constin[5:0]};

endmodule