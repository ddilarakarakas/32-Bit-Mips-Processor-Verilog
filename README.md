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
| LW | L | 10 0011 | xx xxxx | 00 | 1 | 0 | 1 | 01 | 1 | 0 | 0 | 00 |
| Sw | L | 10 1011 | xx xxxx | 00 | 1 | 1 | 0 | 00 | x | 0 | 0 | xx |
| J | J | 00 0010 | xx xxxx | xx | x | 0 | 0 | 00 | x | 0 | 0 | xx |
| Jal | J | 00 0011 | xx xxxx | xx | x | 0 | 0 | 01 | x | 0 | 0 | 01 |
| Jr | R | 00 0000 | xx xxxx | 10 | x | 0 | 0 | 0 | x | 0 | 0 | xx|
| Beq | I | 00 0100 | xx xxxx | 01 | 0 | 0 | 0 | 00 | x | 1 | 0 | xx |
| Bne | I | 00 0101 | xx xxxx | 01 | 0 | 0 | 0 | 00 | x | 0 | 1 | xx |
| Addn | R | 00 0000 | 10 0000 | 10 | 0 | 0 | 0 | 11 | 0 | 0 | 0 | 11 |
| Subn | R | 00 0000 | 10 0010 | 10 | 0 | 0 | 0 | 11 | 0 | 0 | 0 | 11 |
| Xorn | R | 00 0000 | 10 0110 | 10 | 0 | 0 | 0 | 11 | 0 | 0 | 0 | 11 |
| Andn | R | 00 0000 | 10 0100 | 10 | 0 | 0 | 0 | 11 | 0 | 0 | 0 | 11 |
| Orn | R |  00 0000 | 10 0101 | 10 | 0 | 0 | 0 | 11 | 0 | 0 | 0 | 11 |
