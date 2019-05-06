module Traffic_Light(L,R,LT,RT,HAZ,clk);

input LT,RT,HAZ,clk;
output reg [2:0]L,R;

wire clk_5Hz;

clock_divide_module M1(.clk_50Mhz(clk),.clk_5Hz(clk_5Hz));

always@(LT,RT,HAZ)
begin
begin
	if(HAZ)
	begin
		L[2] <= 1'b1 & clk_5Hz;
		L[1] <= 1'b1 & clk_5Hz;
		L[0] <= 1'b1 & clk_5Hz;
		R[2] <= 1'b1 & clk_5Hz;
		R[1] <= 1'b1 & clk_5Hz;
		R[0] <= 1'b1 & clk_5Hz;
	end
else if(LT & RT &(~HAZ))
	begin
	   L[2] = 1'b0; 
		L[1] = 1'b0;
		L[0] = 1'b0; 
		R[2] = 1'b0; 
		R[1] = 1'b0; 
		R[0] = 1'b0; 
	end
	
	else if(RT & (~LT) &(~HAZ))
	begin
	   R[2] = 1'b1 & clk_5Hz;
		R[1] = 1'b1 & clk_5Hz;
		R[0] = 1'b1 & clk_5Hz;
		L[2] <= 1'b0;
		L[1] <= 1'b0;
		L[0] <= 1'b0;
	end
else if(LT & (~RT) &(~HAZ))
	begin
		R[2] <= 1'b0;
		R[1] <= 1'b0;
		R[0] <= 1'b0;
	   L[2] = 1'b1 & clk_5Hz;
		L[1] = 1'b1 & clk_5Hz;
		L[0] = 1'b1 & clk_5Hz;
	end
	
	else
	begin
		L[2] <= 1'b0;
		L[1] <= 1'b0;
		L[0] <= 1'b0;
		R[2] <= 1'b0;
		R[1] <= 1'b0;
		R[0] <= 1'b0;
	end
end
end

endmodule
