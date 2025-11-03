module d_latch(
    input  D,
    input  E,
    output reg Q,
    output     NotQ
);
    always @(D, E) begin
        if (E)
            Q <= D; // latch while E high
    end

    assign NotQ = ~Q;
endmodule