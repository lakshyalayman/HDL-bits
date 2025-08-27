module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
  wire cout,cd;
  add16 inst1 (a[15:0],{16{sub}}^b[15:0],sub,sum[15:0],cout);
  add16 inst2 (a[31:16],{16{sub}}^b[31:16],cout,sum[31:16],cd);
endmodule
