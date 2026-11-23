// This file is part of nand2tetris, as taught in The Hebrew University, and
// was written by Aviv Yaish. It is an extension to the specifications given
// [here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
// as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
// Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).

// Multiplies R0 and R1 and stores the result in R2.
//
// Assumptions:
// - R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.
// - You can assume that you will only receive arguments that satisfy:
//   R0 >= 0, R1 >= 0, and R0*R1 < 32768.
// - Your program does not need to test these conditions.
//
// Requirements:
// - Your program should not change the values stored in R0 and R1.
// - You can implement any multiplication algorithm you want.

// Put your code here.

//int R2 = 0;
//for(int i = 0; i<R0 ; i++){
//  R2+= R1;
//}


//i = 0 (our counter)
@i
M=0

//set n = R0 (stopping condition)
@R0
D=M
@n
M=D

//set starting sum to zero
@R2
M=0

//our LOOP
(LOOP)
//if i = n jump to end else keep reading following instructions
@i
D=M
@n
D=D-M
@END
D;JEQ
//adding R1 to the temporary sum (R2)
@R1
D=M
@R2
M=M+D
//increase counter by 1
@i
M=M+1
//next it.
@LOOP
0;JMP

//infinite loop for end of program
(END)
@END
0;JMP