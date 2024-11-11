module programcounter(clock, reset, stall, branch, branchaddress, pc):
    input wire clock;
    input wire reset;
    input wire stall;
    input wire branch;
    input wire[63:0] branchaddress;
    output reg[63:0] pc;

    // start the value of the register out at 0

    initial 
        pc <= 64'b0
    end

    // every clock cycle, reset the value if the reset signal is high, otherwise, progress the branch forward if there is no stall.

    always @ (posedge clock or posedge reset) begin
        if (reset)
            pc <= 64'b0
        if (!stall)
            pc = branch ? branchaddress : pc + 64'd4
    end


endmodule