module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
  wire [100:0] carry;
  assign carry[0] = cin;
  genvar i;
  // i*4 -> i*4+3
  // 0 -> 3
  // 4 -> 7 (7-4+1 = 8)
  // 396 -> 399
  generate
    for ( i = 0; i < 100; i=i+1) begin:bcd_add
      bcd_fadd(
        .a(a[(i*4+3):(i*4)]),
        .b(b[(i*4+3):(i*4)]),
        .cin(carry[i]),
        .cout(carry[i+1]),
        .sum(sum[(i*4+3):(i*4)])
      );
    end
  endgenerate
  assign cout = carry[100];
endmodule
