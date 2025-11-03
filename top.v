module top(
    input  wire [15:0] sw,
    input  wire        btnC,
    output wire [15:0] led
);
    wire q_part1, notq_part1;
    wire [7:0] mem_out;

    // Part 1: D-Latch
    d_latch u_d_latch (
        .D(sw[0]),
        .E(btnC),
        .Q(q_part1),
        .NotQ(notq_part1)
    );

    // Part 2: 4-byte memory
    memory_system u_mem (
        .data(sw[15:8]),
        .store(btnC),
        .addr(sw[7:6]),
        .memory(mem_out)
    );

    // LED mapping
    assign led[0]    = q_part1;
    assign led[1]    = notq_part1;
    assign led[7:2]  = 6'b0;
    assign led[15:8] = mem_out;
endmodule