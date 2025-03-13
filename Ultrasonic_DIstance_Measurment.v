 
     
module project(clk,echo,trigger,seg1,seg,seg2,seg3);
input clk,echo;
output reg trigger;
output reg [6:0]seg;
output reg [6:0]seg1;
output reg [6:0]seg2;
output reg [6:0]seg3;

reg[31:0]distance;
reg [31:0]a;
reg [31:0]b;
reg [31:0]c;
reg [31:0]d;
reg [31:0]temp2;
reg [31:0]temp3;
reg [31:0]temp1;
reg [31:0]count8;
reg nclk;
reg [31:0]w1;
reg [31:0]w2;
reg [31:0]w3;
reg [31:0]w4;
 
parameter oncount=500;
parameter offcount=10000000;
reg [31:0]count;
reg [31:0]timeofecho,finaltime,timeofecho2;
 
 
initial begin
    trigger=0;
	 distance=0;
	 count=0;
	 timeofecho=0;
	 finaltime=0;
	 timeofecho2=0;
	 nclk=0;
	 count8=0;
	 end
 
 
 
 
always@(posedge clk)
 begin
 if(trigger==1)
   begin
	count=count+1;
	if(count==oncount)
	begin
	count=0;
	trigger=0;
	end
	end
 
 
 
 
else
   begin
	count=count+1;
	if(count==offcount)
	begin
	count=0;
	trigger=1;
	end
	end
 
 
 
 
end
 
 
 
always@(posedge clk)
begin
 temp1=(timeofecho2)*(171);
 
 temp2=temp1/100;
 temp3=temp2/500;
 distance=temp3/10;
 
end
 
 
 
 
 always@(posedge clk)
 begin
    if(echo==1)
	 begin
	timeofecho=timeofecho+1;
	finaltime=timeofecho;

	 end
 
	 else if(echo==0)
	 begin
 
 

	 timeofecho2=finaltime+1;
	 timeofecho=0;

	 end
end
 
always @(posedge clk) begin
		count8=count8+1;
 
 		if(count8==50000) begin
			nclk=~nclk;
			count8=0;
		end	
	end
 
 always@(*)
	begin
	w1=distance/100;
   a=w1/10;
	w2=distance%100;
	w3=w2%10;
   b=w3/100;
	c=w2/10;
	d=(distance%10);
	end
 
	always @(posedge nclk)
	begin
		case(d)
 
		      0: seg=7'b0000001;
			  	1: seg=7'b1001111;
				2: seg=7'b0010010;
				3: seg=7'b0000110;
				4: seg=7'b1001100;
				5: seg=7'b0100100;
				6: seg=7'b0100000;
				7: seg=7'b0001111;
				8: seg=7'b0000000;
				9: seg=7'b0000100;
		endcase
		case(c)
 
		      0: seg1=7'b0000001;
			  	1: seg1=7'b1001111;
				2: seg1=7'b0010010;
				3: seg1=7'b0000110;
				4: seg1=7'b1001100;
				5: seg1=7'b0100100;
				6: seg1=7'b0100000;
				7: seg1=7'b0001111;
				8: seg1=7'b0000000;
				9: seg1=7'b0000100;
		endcase
		case(b)
 
		      0: seg2=7'b0000001;
			  	1: seg2=7'b1001111;
				2: seg2=7'b0010010;
				3: seg2=7'b0000110;
				4: seg2=7'b1001100;
				5: seg2=7'b0100100;
				6: seg2=7'b0100000;
				7: seg2=7'b0001111;
				8: seg2=7'b0000000;
				9: seg2=7'b0000100;
		endcase
 
		case(a)
 
		      0: seg3=7'b0000001;
			  	1: seg3=7'b1001111;
				2: seg3=7'b0010010;
				3: seg3=7'b0000110;
				4: seg3=7'b1001100;
				5: seg3=7'b0100100;
				6: seg3=7'b0100000;
				7: seg3=7'b0001111;
				8: seg3=7'b0000000;
				9: seg3=7'b0000100;
		endcase
 
 
 
 
 end
endmodule
 
 
 
 
