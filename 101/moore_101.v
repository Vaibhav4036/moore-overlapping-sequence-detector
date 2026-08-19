
module seq101_moore(
           input clk,reset,x,
           output reg z
    );
reg [2:0]state; 
parameter S0 = 3'b000;
parameter S1 = 3'b001;
parameter S2 = 3'b010;
parameter S3 = 3'b101;

always@(posedge clk)
begin 
  if(reset)
    state <= S0;
  else 
      begin 
           case(state)
           S0:
              begin 
                 if(x==0)
                   state <= S0;
                 else
                    state <= S1;
              end
            S1: 
               begin 
                  if(x==0)
                    state <= S2;
                  else 
                     state <= S1;
               end
             S2:
                begin 
                   if(x==0)
                     state <= S0;
                   else
                      state <= S3;
                end
             S3:
                begin 
                  if(x==0)
                    state <= S2;
                  else
                    state <= S1;
                end
             
             default: state <= S0;
             endcase
      end
end

always@ (*)
begin
   case(state)
   S0: z = 0;
   S1: z = 0;
   S2: z = 0;
   S3: z = 1;
   default: z = 0;
   endcase
end
endmodule
