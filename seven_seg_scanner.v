module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    wire [3:0] next;
    wire [3:0] state;
    
    dff Adff(
        .Default(1'b1),
        .D(next[0]),
        .clk(div_clock),
        .Q(state[0]),
        .reset(reset)
    );

    dff Bdff(
        .Default(1'b0),
        .D(next[1]),
        .clk(div_clock),
        .Q(state[1]),
        .reset(reset)
    );

    dff Cdff(
        .Default(1'b0),
        .D(next[2]),
        .clk(div_clock),
        .Q(state[2]),
        .reset(reset)
    );
    
    dff Ddff(
        .Default(1'b0),
        .D(next[3]),
        .clk(div_clock),
        .Q(state[3]),
        .reset(reset)
    );
    
    assign anode = ~state;
    assign next[0] = state[3];
    assign next[1] = state[0];
    assign next[2] = state[1];
    assign next[3] = state[2];

endmodule
