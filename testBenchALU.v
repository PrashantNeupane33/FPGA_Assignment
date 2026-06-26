`timescale 1ns/1ps

module tb_ALU;

    reg  [3:0] opcode;
    reg        clk, reset;
    reg  [7:0] operand1, operand2;
    wire [7:0] result;
    wire [2:0] flag;

    ALU dut (
        .opcode(opcode),
        .clk(clk),
        .reset(reset),
        .operand1(operand1),
        .operand2(operand2),
        .result(result),
        .flag(flag)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Generate VCD file for GTKWave
    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, tb_ALU);
    end

    initial begin

        // Reset
        opcode   = 4'b0000;
        operand1 = 0;
        operand2 = 0;
        reset    = 1;

        @(posedge clk);
        #1;
        reset = 0;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // NOP
        opcode = 4'b0000;
        operand1 = 10;
        operand2 = 20;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // ADD 15 + 10
        opcode = 4'b0001;
        operand1 = 15;
        operand2 = 10;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // ADD 200 + 100
        opcode = 4'b0001;
        operand1 = 200;
        operand2 = 100;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // SUB 12 - 8
        opcode = 4'b0010;
        operand1 = 12;
        operand2 = 8;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // SUB 10 - 20
        opcode = 4'b0010;
        operand1 = 10;
        operand2 = 20;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // INC
        opcode = 4'b0011;
        operand1 = 5;
        operand2 = 1;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // DEC
        opcode = 4'b0100;
        operand1 = 5;
        operand2 = 1;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // Complement
        opcode = 4'b0101;
        operand1 = 0;
        operand2 = 0;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // Left Shift
        opcode = 4'b0110;
        operand1 = 5;
        operand2 = 2;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // Right Shift
        opcode = 4'b0111;
        operand1 = 160;
        operand2 = 3;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // Set Flag
        opcode = 4'b1001;
        operand1 = 5;
        operand2 = 0;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // Get Flag
        opcode = 4'b1000;
        operand1 = 0;
        operand2 = 0;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // AND
        opcode = 4'b1010;
        operand1 = 240;
        operand2 = 60;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // OR
        opcode = 4'b1011;
        operand1 = 240;
        operand2 = 15;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        // XOR
        opcode = 4'b1100;
        operand1 = 170;
        operand2 = 15;

        @(posedge clk);
        #1;
        $display("time=%0t opcode=%b op1=%d op2=%d result=%d flag=%b",
                 $time, opcode, operand1, operand2, result, flag);

        $finish;

    end

endmodule
