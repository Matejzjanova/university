module dff_my(clock,Data,q);
input clock, Data;
output q;
reg q;
always @(negedge clock)
	q<=Data;
endmodule