// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(INPUTLOOP)
@KBD
D=M
@SETBLACK
D;JGT
(SETWHITE)
@color
M=0
(WRITELOOP)
@i			// i = current iteration in screen writing
M=1
@SCREEN
D=A
@addr		// addr = current screen address, 16384
M=D
@8192
D=A
@length		// length = length of screen in memory, 8192
M=D
(LOOP)
@i			// if i>length goto INPUTLOOP
D=M
@length
D=D-M
@INPUTLOOP
D;JGT
@color
D=M
@addr
A=M
M=D			// write color
@addr
M=M+1		// move to next address
@i			// i++
M=M+1
@LOOP
0;JMP
(SETBLACK)
@color
M=-1
@WRITELOOP
0;JMP