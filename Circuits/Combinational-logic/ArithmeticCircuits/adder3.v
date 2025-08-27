module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output reg [2:0] sum );
  // assign {cout,sum} = a+b+cin;
  integer i;
  reg [3:0] carry;
  always @(*) begin 
    carry[0] = cin;
    for(i = 0;i<3;i=i+1)begin
      sum[i] = a[i]^b[i]^carry[i];
      carry[i+1]= (a[i]&b[i]) | (b[i]&carry[i]) | (carry[i]&a[i]);
    end
  end
  assign cout = carry[3:1];
endmodule
