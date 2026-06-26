# Project Title
---
8-bit ALU implementation on verilog for FPGA elective's assignment-1. This implementation ALU supports arithmetic,logical and shift operation and has three flags {Zero, Carry, Parity} to denote the state of obtained results.

## Features
- Support arithmetic operations: Addition, Subtraction, Increment and Decrement
- Support logical operation: AND, OR, XOR, Compliment
- Support shift operation: Left Shift, Right Shift
- Also support a NOP instruction for delay purpose, Get Flag instruction to retrieve flag, and Set flag to set the set flag with desired value.

## Opcode
| Opcode | Mnemonic |
|--------|----------|
| 0000   | NOP      |
| 0001   | ADD      |
| 0010   | SUB      |
| 0011   | INC      |
| 0100   | DEC      |
| 0101   | CMP      |
| 0110   | LSHIFT   |
| 0111   | RSHIFT   |
| 1000   | Get Flag |
| 1001   | Set Flag |
| 1010   | AND      |
| 1011   | OR       |
| 1100   | XOR      |

## ALU Operation
ALU takes two operand: operand1 and operand2 as input to operate on. If the instruction only requires a single operand as such in INC,DEC, CMP, it will operate on operand1 only. In case of shift operations, operand1 will be shifted and operand2 will provide the number of bit to be shifted (0-7). The shift operation was implemented using barrel shifter, one for left shift and one for right shift. Three stage barrel shifter is implemented using 2x1 MUX, ternary operators are used instead of MUX.

Flags are updated after each ALU operation. All arithmetic operation change all three flags but other operation wont change any flag at all. 

## Tests


