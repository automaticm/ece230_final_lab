module clock_div
#(
    parameter DIVIDE_BY = 17,
    parameter DIVISOR=2'd3
)
(
    input clock,
    input reset,
    output div_clock
);
    wire [DIVIDE_BY-1:0] q;
    wire [DIVIDE_BY-1:0] d;


  dff dff_inst(
                .Default(1'b0),
                .D(d[0]),
                .clk(clock),
                .reset(reset),
                .Q(q[0]),
                .NotQ(d[0])
            );


 genvar i;
    generate
        for(i = 1; i < DIVIDE_BY; i = i+1) begin
            dff dff_inst(
                .Default(1'b0),
                .D(d[i]),
                .clk(q[i-1]),
                .reset(reset),
                .Q(q[i]),
                .NotQ(d[i])
            );
        end
    endgenerate
    
    assign div_clock = q[DIVIDE_BY-1];
    
endmodule