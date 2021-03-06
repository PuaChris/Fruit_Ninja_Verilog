`timescale 1ms/1ns


// 50MHz Clock
// 60Hz enable
module clock_divider(Clock, Resetn, Enable);
	input Clock, Resetn;
	output reg Enable;
	
	localparam Max_count = 833_333;	
//	localparam Max_count = 2;	// for simulation
	
	reg [19:0] Count;
	
	always @(posedge Clock) begin
	
		if (!Resetn) begin
			Enable <= 0;
			Count <= 0;
		end
	
		else if (Count >= Max_count) begin
			Enable <= 1;
			Count <= 0;
		end
		
		else begin
			Enable <= 0;
			Count <= Count + 1;
		end
		
	end
endmodule
