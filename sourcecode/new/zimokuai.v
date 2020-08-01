`timescale 1ns / 1ps
module zimokuai(
clk,
f_p_number_A,
f_p_number_B,
option,
result
);
input clk;
input [31:0]f_p_number_A;
input [31:0]f_p_number_B;
input [7:0]option;
output reg [31:0]result;
wire [3:0]m_axis_result_tvalid;
reg [31:0] adder_a=0;
reg [31:0] adder_b=0;
wire [31:0] adder_out;
reg [31:0] multiplier_a=0;
reg [31:0] multiplier_b=0;
wire [31:0] multiplier_out;
reg [31:0] divider_a=0;
reg [31:0] divider_b=0;
wire [31:0] divider_out;
reg [31:0] subtracter_a=0;
reg [31:0] subtracter_b=0;
wire [31:0] subtracter_out;
jiafa test_1(
.aclk(clk),                                 
.s_axis_a_tvalid(1'd1),           
.s_axis_a_tdata(adder_a),            
.s_axis_b_tvalid(1'd1),           
.s_axis_b_tdata(adder_b),             
.m_axis_result_tvalid(m_axis_result_tvalid[0]),  
.m_axis_result_tdata(adder_out)   
);
jianfa test_2(
.aclk(clk),                                
.s_axis_a_tvalid(1'd1),          
.s_axis_a_tdata(subtracter_a),     
.s_axis_b_tvalid(1'd1),            
.s_axis_b_tdata(subtracter_b),           
.m_axis_result_tvalid(m_axis_result_tvalid[1]), 
.m_axis_result_tdata(subtracter_out)   
);
chengfa test_3(
.aclk(clk),                           
.s_axis_a_tvalid(1'd1),        
.s_axis_a_tdata(multiplier_a),             
.s_axis_b_tvalid(1'd1),         
.s_axis_b_tdata(multiplier_b),             
.m_axis_result_tvalid(m_axis_result_tvalid[2]),  
.m_axis_result_tdata(multiplier_out)   
);
chufa test_4(
.aclk(clk),                               
.s_axis_a_tvalid(1'b1),        
.s_axis_a_tdata(divider_a),           
.s_axis_b_tvalid(1'b1),           
.s_axis_b_tdata(divider_b),          
.m_axis_result_tvalid(m_axis_result_tvalid[3]),  
.m_axis_result_tdata(divider_out)   
);
always@(posedge clk)
begin
case(option)
2'h0:
begin    
adder_a<=f_p_number_A;
adder_b<=f_p_number_B;
result<=adder_out;
end
2'h1:
begin   
subtracter_a<=f_p_number_A;
subtracter_b<=f_p_number_B;
result<=subtracter_out;
end
2'h2:
begin   
multiplier_a<=f_p_number_A;
multiplier_b<=f_p_number_B;
result<=multiplier_out;
end
2'h3:
begin  
divider_a=f_p_number_A;
divider_b=f_p_number_B;
result<=divider_out;
end
default: 
begin
subtracter_a<=f_p_number_A;
subtracter_b<=f_p_number_B;
result<=subtracter_out;
end
endcase
end
endmodule

