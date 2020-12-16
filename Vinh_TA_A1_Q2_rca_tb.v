/* Description: Testbench for RCA implementation
 * Author: Vinh TA
*/

module tb;
  parameter integer WIDTH=8;
  reg in; reg [WIDTH-1:0] A,B;
  reg [WIDTH-1:0] expected;
  reg result=1;
  wire out;
  wire [WIDTH-1:0] S;
  RCA #(.WIDTH(WIDTH)) R4(.A(A),.B(B),.c0(in),.cout(out),.S(S));

  initial
  begin
    in =0;
    repeat(10)
      begin
        #1;
	A=$random;
	B=$random;
	expected=A+B;

	#2; if(expected!=S)
	  result=0;
      end
    #2;
  end

  initial
  begin
    #30;
    if(result)
      $display("All inputs are verified");
    else
      $display("Not correct");  
  end
endmodule