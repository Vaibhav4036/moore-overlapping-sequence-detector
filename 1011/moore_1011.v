
module seq1011_moore(
        input clk, reset,x,
        output reg z
    );
reg [3:0] state;
reg [3:0] next_state;

parameter S0 = 4'b0000;
parameter S1 = 4'b0001;
parameter S2 = 4'b0010;
parameter S3 = 4'b0101;
parameter S4 = 4'b1011;

always@ (posedge clk)
begin 
   if(reset)
     state <= S0;
   else 
      state <= next_state;
end

always@ (*)
begin 
    case (state)
    S0: 
      begin 
        if(x==0)
         next_state = S0;
        else
          next_state = S1;
      end
     S1: 
       begin 
          if(x==0)
           next_state = S2;
          else 
            next_state = S1;
       end
     S2:
        begin 
           if(x==0)
            next_state = S0;
           else 
             next_state = S3;         
        end
      S3:
         begin 
            if(x==0)
              next_state = S2;
            else
               next_state = S4;
         end
       S4:
         begin 
            if(x==0)
              next_state = S2;
            else
               next_state = S1;
         end
        default: next_state = S0;
       endcase
end

always@ (*)
begin 
  case(state)
     S0: z = 0; 
     S1: z = 0; 
     S2: z = 0; 
     S3: z = 0;
     S4: z = 1;
     default: z = 0;
  endcase
end
endmodule
