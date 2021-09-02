# _32 Bit Mips Processor Verilog_

This project was used Altera Quartus II with Verilog. It was implemented a different version of 32-bit MIPS. 

## _Prerequisites_

Project has two memories: Data Memory and Instruction Memory. 
“data.mem” and “register.mem” files are need in the simulation directory. Some test instructions are given ,it includes all the instructions.

## _Instructions_

Project is supported lw, sw, j, jal, jr, beq, bne, addn, subn, xorn, andn, orn and ori instructions.But the R-type instructions executed different than the conventional MIPS we have seen. This is why they have ‘n’ at the end (representing new). The new instructions have the same opcode and function fields as the conventional R-type instructions. For instance the opcode and function field of orn is same as or.

### _R Type_

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
   >XORN

```sh
       $rs <= $rs xor $rt 
      if($rs xor $rt == 0)
        $rd <= 1
      else if($rs xor $rt < 0)
        $rd <= 2 
      else
        $rd <= 3
```   
   >SUBN

```sh
      $rs <= $rs - $rt 
      if($rs - $rt == 0) 
        $rd <= 1
      else if($rs - $rt < 0)
        $rd <= 2 
      else
        $rd <= 3
```
   >ORN

```sh
      $rs <= $rs or $rt 
      if($rs or $rt == 0)
        $rd <= 1 
      else if($rs or $rt < 0)
        $rd <= 2 
      else
        $rd <= 3
```
   >ANDN

```sh
      $rs <= $rs and $rt 
      if($rs and $rt == 0)
        $rd <= 1
      else if($rs and $rt < 0)
        $rd <= 2
      else
        $rd <= 3
```

### _I Type_

   >ORI

```sh
      RT = RS + ZEROEXTEND
```

   >LW

```sh
      RT = MEM[RS + SIGNEXTEND]
```

   >SW

```sh
      MEM[RS + SIGNEXTEND] = RT
```

   >BEQ

```sh
      (RS == RT) ? 1: PC = PC + 4 + BRANCHADDER
```

   >BNE

```sh
      (RS == RT) ? 0: PC = PC + 4 + BRANCHADDER
```
### _J Type_

   >J

```sh
      PC = JUMP-ADDER
```

   >JAL

```sh
      R[31] = PC + 8, PC = JUMP-ADDER
```

   >JR

```sh
      PC = RS
```

### _Instruction Table_

| Inst Name | Type | Opcode | Function | ALUOp | ALUSrc | MemWrite | MemRead | RegWrite | MemtoReg | Branch | Bne | sRs |
| --------- | ---- | ------ | -------- | ----- | ------ | -------- | ------- | -------- | -------- | ------ | --- | --- |
| LW | L | 10 0011 | xx xxxx | 0 0 | 1 | 0 | 1 | 0 1 | 1 | 0 | 0 | 0 0 |
| Sw | L |
| J | J | 
| Jal | J |
| Jr | R | 
| Beq | I |
| Bne | I |
