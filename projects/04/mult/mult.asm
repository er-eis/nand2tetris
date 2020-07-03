// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The program assumes R0>=0, R1>=0, and R0*R1<32768.

@i
M=1		// i = 1
@sum
M=0		// sum = 0
(LOOP)
@i		// if i>RAM[0] goto WRITE
D=M
@R0
D=D-M
@WRITE
D;JGT
@R1		// sum += R1
D=M
@sum
M=D+M
@i		// i++
M=M+1
@LOOP 	// goto LOOP
0;JMP
(WRITE)
@sum	// write sum to R2
D=M
@R2
M=D
(END)
@END
0;JMP