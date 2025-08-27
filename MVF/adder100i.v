module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
  wire [99:0] carry;
  genvar i;
  assign sum[0] = a[0]^b[0]^cin;
  assign carry[0] = (a[0]&b[0]) | (b[0]&cin) | (cin&a[0]);
  generate
    for(i = 1;i<100;i=i+1) begin :vamos
      assign sum[i] = a[i]^b[i]^carry[i-1];
      assign carry[i] = (a[i]&b[i]) | (b[i]&carry[i-1]) | (carry[i-1]&a[i]);
    end
  endgenerate
  assign cout = carry;
endmodule
