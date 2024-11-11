module registerfile(clock, rr1, rr2, wr, wv, rw, rv1, rv2, reset)
    input wire clock;
    input wire reset;
    // 32 registers, 5 bit register address
    input wire [4:0] rr1; // read register 1
    input wire [4:0] rr2; // read register 2
    input wire [4:0] wr; // write register
    input wire [63:0] wv; // write value
    input wire rw; // register write (control signal)

    output wire [63:0] rv1; // read value 1
    output wire [63:0] rv2; // read value 2

    reg[63:0] registers[0:31] // 32 registers that are 64 bits each

    assign rv1 = registers[rr1];
    assign rv2 = registers[rr2];

    always @ (posedge clock or posedge reset)
        if (reset)
            for (i = 0; i < 32; i++) {
                registers[i] <= 64'b0;
            }
        else if (rw && wr != 5'b31) {
            register[wr] = wv;
        }
    end

endmodule
