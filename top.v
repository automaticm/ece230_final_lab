module top
#(
    parameter DIVIDE_BY = 17 // Use this when passing in to your clock div!
    // The test bench will set it appropriately for testing
)
(
    input [7:0] sw, // A and B
    input clk, // 100 MHz board clock
    input btnC, // Reset
    output [3:0] an, // 7seg anodes
    output [6:0] seg // 7seg segments
);
    wire div_clock;
    wire [3:0] AplusB, AminusB;
    
    clock_div #(.DIVIDE_BY(DIVIDE_BY))clock_inst(
        .clock(clk),
        .reset(btnC),
        .div_clock(div_clock)
    );
    
    seven_seg_scanner scan_inst(
        .div_clock(div_clock),
        .reset(btnC),
        .anode(an)
    );
    
    seven_seg_decoder decode_inst(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB),
        .anode(an),
        .segs(seg)
    );
    
    math_block math_inst(
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB)
    );
    
    

endmodule