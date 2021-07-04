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

// Put your code here.

//Set End of address
@8192
D=A
@SCREEN
D=A+D
@DRAW_END_ADR
M=D

(INIT)
    //Clear count
    @draw_count
    M=0
    //Read KBD
    @KBD
    D=M
    @IF_PUSH
    D;JGT
    @ELSE
    0;JMP
(IF_PUSH)   //BLACK
    @col
    M=-1
    @ENDIF
    0;JMP
(ELSE)  //WHITE
    @col
    M=0
(END_IF)

(DRAW_LOOP)
    
    //Calc Address
    @draw_count
    D=M
    @SCREEN
    D=A+D
    @adr
    M=D

    //Check End
    @DRAW_END_ADR
    D=M-D
    @INIT
    D;JEQ
    
    //Load col
    @col
    D=M

    //Draw
    @adr
    A=M
    M=D
        
    @draw_count
    M=M+1

    @DRAW_LOOP
    0;JMP