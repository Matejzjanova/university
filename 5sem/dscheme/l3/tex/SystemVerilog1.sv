module simple (a1, a2, a3, a4, y1); 
input a1, a2, a3, a4;
output y1;
assign y1 = a2 & a4 | ~a4 & ~a1 | ~a1 & ~a3;
endmodule