module simple(a1, a2, a3, a4, y);
input a1, a2, a3, a4;
output y;
assign y = (~a2 | a4) & (~a4 | a1 | a2);
endmodule 