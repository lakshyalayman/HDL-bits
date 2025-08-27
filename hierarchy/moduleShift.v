module top_module ( input clk, input d, output q );
  wire out1,out2,out3;
  my_dff inst1 (clk,d,out1);
  my_dff inst2 (clk,out1,out2);
  my_dff inst3 (clk,out2,q);

endmodule
