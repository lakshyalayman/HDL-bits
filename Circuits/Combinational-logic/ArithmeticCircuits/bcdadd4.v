module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
  wire [4:0] carry;
  assign carry[0] = cin;
  genvar i;
  generate
    for(i = 0;i<4;i=i+1) begin:vamos
      bcd_fadd inst (a[i*4+3:i*4],b[i*4+3:i*4],carry[i],carry[i+1],sum[i*4+3:i*4]);
    end
  endgenerate
  assign cout = carry[4];
endmodule
