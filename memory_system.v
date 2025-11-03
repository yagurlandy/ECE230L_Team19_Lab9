module memory_system(
    input  wire [7:0] data,   // sw[15:8]
    input  wire       store,  // btnC
    input  wire [1:0] addr,   // sw[7:6]
    output wire [7:0] memory  // led[15:8]
);
    wire [7:0] dA, dB, dC, dD;
    wire sA, sB, sC, sD;
    wire [7:0] mA, mB, mC, mD;

    // Demux data and store
    demux1to4_8 demux_data (.data(data), .sel(addr), .A(dA), .B(dB), .C(dC), .D(dD));
    demux1to4_1 demux_store(.in_bit(store), .sel(addr), .A(sA), .B(sB), .C(sC), .D(sD));

    // Four byte memories
    byte_memory mem0(.data(dA), .store(sA), .memory(mA));
    byte_memory mem1(.data(dB), .store(sB), .memory(mB));
    byte_memory mem2(.data(dC), .store(sC), .memory(mC));
    byte_memory mem3(.data(dD), .store(sD), .memory(mD));

    // Output mux
    mux4to1_8 mux_out(.A(mA), .B(mB), .C(mC), .D(mD), .sel(addr), .out(memory));
endmodule