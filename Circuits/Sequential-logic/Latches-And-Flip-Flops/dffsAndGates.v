module top_module (
    input clk,
    input x,
    output z
); 
  reg a,b,c;
  initial begin 
    a=0;
    b=0;
    c=0;
  end
  always @(posedge clk) begin 
    a<=a^x;
    b <= ~b & x;
    c <= ~c | x;

  end

  assign z = ~(a | b | c);
endmodule
