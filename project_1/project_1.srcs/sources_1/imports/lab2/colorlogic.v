`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Anthony Dresser
// 
// Create Date:    21:10:50 02/01/2015 
// Design Name: 
// Module Name:    colorlogic 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: The interface for the VGA display. sw represents what "mode" the
// display is in. ay, by, bally, ballx correspond to the positions of the objects
// in the pong game. colors is the output with the color information.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module colorlogic(
    input blank,
	input [3:0] sw,
	input [10:0] hcount,
	input [10:0] vcount,
	 output reg [11:0] colors
    );
	
	//colors is {r0, r1, r2, g0, g1, g2, b1, b2}

	always @ (blank, sw, hcount, vcount)
	begin
		if(blank) //if off the screen just make it black
			colors = 8'h00;
		else
			if(sw == 5'b0001) //black display
				colors = 12'b00011100;
			else if(sw == 5'b0010) //yellow display
				colors = 12'b11111100;
			else if(sw == 5'b0100) // blue block 32 rows by 16 columns in the middle of the screen
				if(hcount > 304 && hcount < 336 && vcount > 232 && vcount < 248)
					colors = 12'b00000011;
				else
					colors = 12'h00;
			else if(sw == 5'b1000) // eight horizontal color bars on the monitor
				if(hcount > 560)
					colors = 12'b11111111;
				else if(hcount > 480)
					colors = 12'b01111111;
				else if(hcount > 400)
					colors = 12'b00111111;
				else if(hcount > 320)
					colors = 12'b00011111;
				else if(hcount > 240)
					colors = 12'b00001111;
				else if(hcount > 160)
					colors = 12'b00000111;
				else if(hcount > 80)
					colors = 12'b00000011;
				else 
					colors = 8'b00000001;
			else
				colors = 8'h00; // else just make a black screen
	end

endmodule
