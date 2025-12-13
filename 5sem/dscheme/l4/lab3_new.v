module lab3_new (clk, clk_JK, J, K, rst_n_inp, q);
input clk, clk_JK, J, K, rst_n_inp;
output q;
reg q;
wire J_state, K_state, clk_state;

Debouncer J_button (J,clk,rst_n_inp,J_state);
Debouncer K_button (K,clk,rst_n_inp,K_state);
Debouncer CLK_button (clk_JK,clk,rst_n_inp,clk_state);

always @(posedge clk_state)
begin
	if (J_state==1 && K_state==0)
		q<=1'b1;
   else 
		if (J_state==0 && K_state==1)
			q<=1'b0;
		else 
			if (J_state==1 && K_state==1)
			q<=~q;
end
endmodule

module Debouncer
(
   input       Signal, 
   input       clk, 
   input wire  reset_n,
   output reg  Button_state
);

/* Register definition */
reg Button_sync_0;
reg Button_sync_1;
reg [17:0] Button_cnt;

always @(posedge clk or negedge reset_n) 
begin
	if (!reset_n)
		Button_sync_0 <= 1'b0;
	else	
		Button_sync_0 <= !Signal;
end   

always @(posedge clk or negedge reset_n) 
begin
	if (!reset_n)
		Button_sync_1 <= 1'b0;	
	else		
		Button_sync_1 <= Button_sync_0;
end   

wire Button_idle = (Button_state==Button_sync_1);
wire Button_cnt_max = &Button_cnt;

always @(posedge clk or negedge reset_n)
begin
	if (!reset_n) 
		Button_cnt 	<= 18'h0;
	else
	begin
		if(Button_idle)
			Button_cnt 	<= 18'h0;
		else
		begin
			Button_cnt 	<= Button_cnt + 18'd1;
			if (Button_cnt_max)
				Button_state <= ~Button_state;
		end
	end
end   

endmodule
