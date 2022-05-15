# ECE251_FinalProject 
by Yuri Hu and Faith Lin. An 8-bit CPU was designed and implemented using Verilog 

## Instruction Set Architecture 
We designed an ISA that utilizes 18-bit instructions consisting of 3 different formats **Register (R-type)**, **Immediate (I-type)** and **Jump (J-type)**. In order for the machine to efficiently identify the type of instruction, all R-type have an opcode starting with 1 while J-type commands have an all 0 opcode and 2 bit for func to further differentiate, anything else is classified as I-type. 

![This is an image]()


## Memory
The memory is byte addressable, since all registers can only carry 8 bits and each instruction has 8 bits. There are two sections of the memory stack, the instruction memory and data memory. Similar to reading LEGv8, memory with larger addresses will be placed at the bottom of the stack and on the top of the stack will be instructions with 0 address, which is the default and working down. 

### imem 
The instruction memory needs to only provide read access because the datapath does not write instructions. It consists of 256 lines of 16-bit instruction. It is word addressed.

### dmem
The data memory is a single-port random access memory (RAM). It consists of 256 lines of 16-bit instruction. It is byte addressed.

## Controller 

The controller operates the timing sequence and access of data in the CPU's modules. This is a single cycle CPU implementation where CPI is 1. The clock here determines the order of events within a gate, and defines when signals can be converted to data to be read or written to processor components. Edge-triggered clocking can support a precise state transition. As instructions are loaded and goes through the decoder, the controller 'lights up' the correct data path based on R, J, I data commands. For R and I-type instructions, it is multiplexers while J-type signals the controller to toggle enable signal in order to change branching. 

## Arithmetic Logic Unit (ALU)
All instruction classes, except unconditional branch, use the ALU after reading the registers. The memory-reference instructions use the ALU for an address calculation, the arithmetic-logical instructions for the operation execution, and conditional branches for comparison to zero. 

(computer organization and design ARM ediiton textbook) 

### Architecture Diagram 

## GTKwave Timing Diagram
