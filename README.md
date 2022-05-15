# ECE251_FinalProject 
by Yuri Hu and Faith Lin. An 8-bit CPU was designed and implemented using Verilog 

## Instruction Set Architecture 
We designed an ISA that utilizes 18-bit instructions consisting of 3 different formats **Register (R-type)**, **Immediate (I-type)** and **Jump (J-type)**. In order for the machine to efficiently identify the type of instruction, all R-type have an opcode starting with 1 while J-type commands have an all 0 opcode and 2 bit for func to further differentiate, anything else is classified as I-type. 

<img width="728" alt="Screen Shot 2022-05-16 at 2 17 15 AM" src="https://user-images.githubusercontent.com/75409461/168487989-647e5836-54eb-4c05-83b0-fa30af254147.png">

<img width="934" alt="Screen Shot 2022-05-16 at 2 16 58 AM" src="https://user-images.githubusercontent.com/75409461/168487913-d61b90d3-cd4e-4db5-bef3-66cf3bb240b0.png">

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

## Architecture Diagram 
### I-type  
![279910773_1395161947613819_8651351898423275588_n](https://user-images.githubusercontent.com/75409461/168488087-25130884-2a56-4e03-8da5-92829eeae9f0.png)

### I-type branch 
![280215140_426966342598406_4893051057257879497_n](https://user-images.githubusercontent.com/75409461/168488097-7561061a-a467-496a-b964-aa2faad2ad3d.png)

### R-type 
![280281698_747099176315353_4281020255502990702_n](https://user-images.githubusercontent.com/75409461/168488092-a748baf4-65fd-4add-998b-cea5367bcf7f.png)

### R-type Store
![279218833_714415766645003_5607809440767389963_n](https://user-images.githubusercontent.com/75409461/168488104-01d89a75-1804-40a4-bb14-263803a6c63d.png)

### R-type Load  
![278471548_740640806976314_1537131029111954008_n](https://user-images.githubusercontent.com/75409461/168488105-49ada2fb-c257-46f9-b28f-5ebc40435aec.png)

### Jump
![278986251_669476350823061_7790292835379738_n](https://user-images.githubusercontent.com/75409461/168488112-3d59709f-acf5-4462-92ca-fa458fe16b75.png)

## GTKwave Timing Diagram

![279455267_377244157516076_6471208653663728499_n](https://user-images.githubusercontent.com/75409461/168488513-e5a6407e-3052-4ac1-ace2-2d076816cb0e.png)
