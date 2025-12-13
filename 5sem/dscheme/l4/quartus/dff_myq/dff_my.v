module dff_my(clock, Data, set, q);
input clock, Data, set;
output q;
reg q;
always @(negedge clock)
            begin
            if (set)
                q <= 1'b1;
            else
                q <= Data;
            end
endmodule
