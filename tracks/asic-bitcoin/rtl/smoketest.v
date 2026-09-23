// Trivial smoke-test design: a D flip-flop with synchronous reset and an
// AND-gate combinational output. Deliberately simple — the point of this
// design is not the logic, it's proving the toolchain works end to end.
module smoketest (
    input  wire clk,
    input  wire rst,
    input  wire a,
    input  wire b,
    output wire y,
    output reg  q
);
    assign y = a & b;

    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= y;
    end
endmodule
