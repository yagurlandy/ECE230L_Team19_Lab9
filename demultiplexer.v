// demultiplexer.v
// Contains both 8-bit and 1-bit demuxes for memory_system

module demux1to4_8(
    input  wire [7:0] data,
    input  wire [1:0] sel,
    output reg  [7:0] A,
    output reg  [7:0] B,
    output reg  [7:0] C,
    output reg  [7:0] D
);
    always @(*) begin
        case (sel)
            2'b00: {D, C, B, A} <= {8'b0, 8'b0, 8'b0, data};
            2'b01: {D, C, B, A} <= {8'b0, 8'b0, data, 8'b0};
            2'b10: {D, C, B, A} <= {8'b0, data, 8'b0, 8'b0};
            2'b11: {D, C, B, A} <= {data, 8'b0, 8'b0, 8'b0};
            default: {D, C, B, A} <= {8'b0, 8'b0, 8'b0, 8'b0};
        endcase
    end
endmodule


module demux1to4_1(
    input  wire       in_bit,
    input  wire [1:0] sel,
    output reg        A,
    output reg        B,
    output reg        C,
    output reg        D
);
    always @(*) begin
        A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
        case (sel)
            2'b00: A = in_bit;
            2'b01: B = in_bit;
            2'b10: C = in_bit;
            2'b11: D = in_bit;
        endcase
    end
endmodule