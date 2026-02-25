// ================================================================
// 16-bit ALU
// Supports arithmetic and logical operations
// ================================================================

module alu16 (
    input  wire [15:0] A,
    input  wire [15:0] B,
    input  wire [3:0]  opcode,
    output reg  [15:0] Y,
    output reg         zero_flag
);

    always @(*) begin
        case (opcode)

            4'b0000: Y = A + B;              // ADD
            4'b0001: Y = A - B;              // SUB
            4'b0010: Y = A & B;              // AND
            4'b0011: Y = A | B;              // OR
            4'b0100: Y = A ^ B;              // XOR
            4'b0101: Y = A * B;              // MUL
            4'b0110: Y = A << 1;             // SHIFT LEFT
            4'b0111: Y = A >> 1;             // SHIFT RIGHT
            4'b1000: Y = (A < B) ? 16'b1 : 16'b0; // LESS THAN

            default: Y = 16'b0;

        endcase

        // Zero flag generation
        if (Y == 16'b0)
            zero_flag = 1'b1;
        else
            zero_flag = 1'b0;
    end

endmodule
