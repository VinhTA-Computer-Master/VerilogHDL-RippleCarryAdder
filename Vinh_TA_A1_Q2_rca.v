/* Description: Parameterized Ripple-Carry Adder Implementation 
 * Author: Vinh TA
 */

/* 1 bit full adder that adds A and B, using cin as carry in input and cout as carry out and S as sum output */

module fullAdder(input A,B,cin, output cout,S);
  wire A,B,cin;
  wire AxorB, a1,a2;
  wire S, cout;
  XOR2X1 g1 (A,AxorB,B);
  XOR2X1 g2 (AxorB,S,cin);
  AND2X1 g3 (cin,AxorB,a1);
  AND2X1 g4 (A,B,a2);
  OR2X1 g5 (a1,a2,cout);
endmodule

/* Parameterized N bits adder that takes N bits number A and B and outputs carry out and N bits sum using 1 bit full adder */

module RCA #(parameter integer WIDTH=4)
       (input wire c0,input wire [WIDTH-1:0] A,B, output cout, output [WIDTH-1:0] S);
  wire [WIDTH-1:0] cin,carry;
  fullAdder adder [WIDTH-1:0] (.A(A),.B(B),.cin(cin),.cout(carry),.S(S));
  assign cin[0] = c0;
  assign cout = carry[WIDTH-1];
  assign cin[WIDTH-1:1] = carry[WIDTH-2:0];
endmodule