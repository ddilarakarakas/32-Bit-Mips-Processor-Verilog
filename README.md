# 32-Bit-Mips-Processor-Verilog

This project was used Altera Quartus II with Verilog. It was implemented a different version of 32-bit MIPS. 

## Prerequisites

Project has two memories: Data Memory and Instruction Memory. 
“data.mem” and “register.mem” files are need in the simulation directory. Some test instructions are given ,it includes all the instructions.

## Instructions

Project is supported lw, sw, j, jal, jr, beq, bne, addn, subn, xorn, andn, orn, ori and lui instructions.But the R-type instructions executed different than the conventional MIPS we have seen. This is why they have ‘n’ at the end (representing new). The new instructions have the same opcode and function fields as the conventional R-type instructions. For instance the opcode and function field of orn is same as or.

- R Type
    
    >ADDN
    ```sh
      $rs <= $rs + $rt 
      if($rs + $rt == 0) 
        $rd <= 1
      else if($rs + $rt < 0)
        $rd <= 2 
      else
        $rd <= 3
    ```
      
