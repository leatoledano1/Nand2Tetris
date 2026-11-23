// This file is part of nand2tetris, as taught in The Hebrew University, and
// was written by Aviv Yaish. It is an extension to the specifications given
// [here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
// as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
// Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).

// The program should swap between the max. and min. elements of an array.
// Assumptions:
// - The array's start address is stored in R14, and R15 contains its length
// - Each array value x is between -16384 < x < 16384
// - The address in R14 is at least >= 2048
// - R14 + R15 <= 16383
//
// Requirements:
// - Changing R14, R15 is not allowed.


// PSEUDO CODE
// 1. If the array is empty, stop.
// 2. Initialize the minimum and maximum with the first element.
// 3. If the array contains only one element, stop.
// 4. Find the address of the last element.
// 5. Traverse the array:
//    - Update the minimum value and its address.
//    - Update the maximum value and its address.
// 6. Swap the minimum and maximum elements.
// 7. Stop the program.

// Put your code here.

// Check whether the array is empty
@R15
D=M
@END
D;JEQ
@R14
D=M
// Initialize the minimum and maximum using the first element
@minadress
M=D
@maxadress
M=D
@pointer
M=D
A=M
D=M
@min
M=D
@max
M=D
// Stop if the array contains only one element
@R15  //check that the array contain more than 1 element 
D=M
D=D-1
@END
D;JEQ
// Calculate the address of the last array element
@R14 
D=M
@R15
D=D+M
D=D-1
@last //the last adress in the array
M=D
// Traverse the array and update the minimum and maximum
(LOOP)
@pointer
M=M+1
A=M
D=M
@min
D=D-M
@NEWMIN
D;JLT
@CONTINUEMIN
0;JMP
(NEWMIN)
@pointer
A=M
D=M
@min
M=D
@pointer
D=M
// Update the minimum value and its address
@minadress
M=D
(CONTINUEMIN)
@pointer
A=M
D=M
@max
D=D-M
@NEWMAX
D;JGT
@CONTINUEMAX
0;JMP
// Update the maximum value and its address
(NEWMAX)
@pointer 
A=M
D=M
@max
M=D
@pointer
D=M
@maxadress
M=D
(CONTINUEMAX)
@pointer
D=M
@last
D=D-M
@SWAP
D;JEQ
@LOOP
0;JMP
// Swap the minimum and maximum elements
(SWAP)
@max
D=M
@minadress
A=M
M=D
@min
D=M
@maxadress
A=M
M=D
// End the program
(END)
@END
0;JMP