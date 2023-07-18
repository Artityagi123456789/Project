`timescale 1ns/1ps
`include "async_fifo.v"
module testbench;
parameter DEPTH=16;
parameter WIDTH=4;
parameter ADDR_WIDTH=$clog2(DEPTH);
reg wr_clk_i,rd_clk_i,reset_i,wr_en_i,rd_en_i;
reg [WIDTH-1:0]wdata_i;
wire empty_o,full_o,error_o;
wire [WIDTH-1:0]rdata_o;
//reg [ADDR_WIDTH-1:0]wr_ptr;//these signals are internal signals, need not to declare inside portlist
//reg [ADDR_WIDTH-1:0]rd_ptr;
//reg wr_toggle_f;
//reg rd_toggle_f;
//reg[WIDTH-1:0]fifo[DEPTH-1:0];
integer i;
Async_fifo #(.WIDTH(WIDTH),.DEPTH(DEPTH),.ADDR_WIDTH(ADDR_WIDTH)) dut(.*);
//---------we need to generate two clock one for write block and another for read block------
initial begin
	wr_clk_i=0;
	forever #10 wr_clk_i=~wr_clk_i;
end
initial begin
	rd_clk_i=0;
	forever #15 rd_clk_i=~rd_clk_i;
end
initial begin
	reset_i=1;
	wr_en_i=0;
	rd_en_i=0;
	wdata_i=0;
	#20;
	reset_i=0;
	for(i=0;i<=DEPTH;i=i+1)begin
		@(posedge wr_clk_i)
		wdata_i=$random;
		wr_en_i=1;
	end
		wdata_i=0;
		wr_en_i=0;
	for(i=0;i<=DEPTH;i=i+1)begin
		@(posedge rd_clk_i)
		rd_en_i=1;
	end
		rd_en_i=0;

end
initial begin
	#1000;
	$finish;
end
endmodule
