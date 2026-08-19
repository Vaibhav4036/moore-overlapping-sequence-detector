
module seq101_moore_tb;
reg clk,reset,x; wire z;
seq101_moore uut(.clk(clk),.reset(reset),.x(x),.z(z));
initial
begin 
 $monitor($time,"clk = %b, reset = %b, x = %b, state = %b, z = %b",
                 clk,reset,x,uut.state,z);
 clk = 0;
 forever #5 clk = ~clk;
end

initial
begin 
 reset = 1; x = 0;
 #10 reset = 0; x = 1;
 #10 x = 0;
 #10 x = 1;
 
 #10 $finish;
end
endmodule
