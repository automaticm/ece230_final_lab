module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
wire [3:0] B_2c;
wire [3:0] add;
wire [3:0] sub;
wire [6:0] carry;

twos_compliment compliment_inst(
    .A(B),
    .Y(B_2c)
);

full_adder add_zero(
    .A(A[0]),
    .B(B[0]),
    .Cin(1'b0),
    .Y(add[0]),
    .Cout(carry[0])
);

full_adder add_one(
    .A(A[1]),
    .B(B[1]),
    .Cin(carry[0]),
    .Y(add[1]),
    .Cout(carry[1])
);

full_adder add_two(
    .A(A[2]),
    .B(B[2]),
    .Cin(carry[1]),
    .Y(add[2]),
    .Cout(carry[2])
);

full_adder add_three(
    .A(A[3]),
    .B(B[3]),
    .Cin(carry[2]),
    .Y(add[3]),
    .Cout(carry[3])
);


full_adder sub_zero(
    .A(A[0]),
    .B(B_2c[0]),
    .Cin(1'b0),
    .Y(sub[0]),
    .Cout(carry[4])
);

full_adder sub_one(
    .A(A[1]),
    .B(B_2c[1]),
    .Cin(carry[4]),
    .Y(sub[1]),
    .Cout(carry[5])
);

full_adder sub_two(
    .A(A[2]),
    .B(B_2c[2]),
    .Cin(carry[5]),
    .Y(sub[2]),
    .Cout(carry[6])
);

full_adder sub_three(
    .A(A[3]),
    .B(B_2c[3]),
    .Cin(carry[6]),
    .Y(sub[3]),
    .Cout()
);

assign AplusB = add;
assign AminusB = sub;

endmodule
