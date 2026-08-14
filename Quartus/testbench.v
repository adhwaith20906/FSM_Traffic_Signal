`timescale 1ns/1ns
module traffic_testbench();
wire [1:0] A_light;
wire [1:0] B_light;
reg clk=0, rst=0;
TrafficFSM TFSM(.clk(clk), .rst(rst), .A_light(A_light), .B_light(B_light));
always #1 clk=~clk;
initial 
begin
        $dumpfile("TFSM.vcd");
        $dumpvars(1,traffic_testbench);
        rst=1;
        #20;	
        rst=0;
        #320;
        rst=1;
        #20;
        rst=0;
        #320;
        $finish;
end
endmodule