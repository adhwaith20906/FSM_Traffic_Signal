`timescale 1ns/1ns
module TrafficFSM #(parameter Green_time=40, Yellow_time=20)
(input clk, input rst,
output reg [1:0] A_light, output reg [1:0] B_light);
reg [7:0] counter;
reg [1:0] state;
localparam A_Green=2'b00;
localparam A_Yellow=2'b01;
localparam B_Green=2'b10;
localparam B_Yellow=2'b11;
always @(posedge clk)
begin
    if(rst)
    begin
        state<=A_Green;
        counter<=0;
    end
    else
    begin
        if(state==A_Green && counter==Green_time)
            state<=A_Yellow;
        else if(state==A_Yellow && counter==Green_time+Yellow_time)
            state<=B_Green;
        else if(state==B_Green && counter==2*Green_time+Yellow_time)
            state<=B_Yellow;
        else if(state==B_Yellow && counter==2*(Green_time+Yellow_time))
            begin
                state<=A_Green;
                counter<=0;
            end
        else
        counter<=counter+1;
    end
end
always @ (state)
begin
    case(state)
    A_Green:begin
        A_light=2'b11;
        B_light=2'b00;
        end
    A_Yellow:begin
        A_light=2'b01;
        B_light=2'b00;
        end
    B_Green:begin
        A_light=2'b00;
        B_light=2'b11;
        end
    B_Yellow:begin
        A_light=2'b00;
        B_light=2'b01;
        end
    endcase
end
endmodule