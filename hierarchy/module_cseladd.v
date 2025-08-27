module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
  wire carry,cd,ce;
  wire [15:0] q1;
  wire [15:0] q2;
  add16 inst1 (a[15:0],b[15:0],1'b0,sum[15:0],carry);
  add16 inst2 (a[31:16],b[31:16],1'b0,q1,cd);
  add16 inst3 (a[31:16],b[31:16],1'b1,q2,ce);
  always @(*) begin
    case (carry)
      1'b0: sum[31:16] = q1;
      1'b1: sum[31:16] = q2;
    endcase
  end

endmodule
