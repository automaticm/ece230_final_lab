module twos_compliment(
    input [7:0] A,
    output [7:0] Y
);

    wire [7:0] thing; 

    full_adder first_bit(
        .A(~A[0]),
        .B(1'b1),
        .Cin(1'b0),
        .Cout(thing[0]),
        .Y(Y[0])
    );
    
    full_adder second_bit(
        .A(~A[1]),
        .B(1'b0),
        .Cin(thing[0]),
        .Cout(thing[1]),
        .Y(Y[1])
    );
    
    full_adder third_bit(
        .A(~A[2]),
        .B(1'b0),
        .Cin(thing[1]),
        .Cout(thing[2]),
        .Y(Y[2])
    );
    
    full_adder fourth_bit(
        .A(~A[3]),
        .B(1'b0),
        .Cin(thing[2]),
        .Cout(thing[3]),
        .Y(Y[3])
    );
    
    full_adder fifth_bit(
        .A(~A[4]),
        .B(1'b0),
        .Cin(thing[3]),
        .Cout(thing[4]),
        .Y(Y[4])
    );
    
    full_adder sixth_bit(
        .A(~A[5]),
        .B(1'b0),
        .Cin(thing[4]),
        .Cout(thing[5]),
        .Y(Y[5])
    );
    
    full_adder seventh_bit(
        .A(~A[6]),
        .B(1'b0),
        .Cin(thing[5]),
        .Cout(thing[6]),
        .Y(Y[6])
    );
    
    full_adder eigth_bit(
        .A(~A[7]),
        .B(1'b0),
        .Cin(1'b0),
        .Y(Y[7])
    );

endmodule