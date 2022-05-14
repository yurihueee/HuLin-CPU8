# ECE251_FinalProject 
by Yuri Hu and Faith Lin
An 8-bit CPU was designed and implemented using Verilog 

## Instruction Set Architecture 
We designed an ISA that utilizes 16-bit instructions consisting of 3 different formats **Register (R-type)**, **Immediate (I-type)** and **Jump (J-type)**. In order for the machine to efficiently identify the type of instruction, all R-type have an opcode starting with 1 while J-type commands have an all 0 first opcode, aything else is classified as I-type. Having an 8-bit CPU allows us to allocate 8-bits for immediate instructions. With the extra unused 8-bits, we will label 2 our registers with 2 bits, 4 registers to handle both input reading from files and output writing to files. 

## Memory
## Controller 
### Main decoder
### ALU decoder
## Arithmetic Logic Unit (ALU) 
### Architecture Diagram 

## GTKwave Timing Diagram
