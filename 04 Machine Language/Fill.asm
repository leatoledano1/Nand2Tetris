// This file is part of nand2tetris, as taught in The Hebrew University, and
// was written by Aviv Yaish. It is an extension to the specifications given
// [here](https://www.nand2tetris.org) (Shimon Schocken and Noam Nisan, 2017),
// as allowed by the Creative Common Attribution-NonCommercial-ShareAlike 3.0
// Unported [License](https://creativecommons.org/licenses/by-nc-sa/3.0/).

// This program illustrates low-level handling of the screen and keyboard
// devices, as follows.
//
// The program runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.
// 
// Assumptions:
// Your program may blacken and clear the screen's pixels in any spatial/visual
// Order, as long as pressing a key continuously for long enough results in a
// fully blackened screen, and not pressing any key for long enough results in a
// fully cleared screen.
//
// Test Scripts:
// For completeness of testing, test the Fill program both interactively and
// automatically.
// 
// The supplied FillAutomatic.tst script, along with the supplied compare file
// FillAutomatic.cmp, are designed to test the Fill program automatically, as 
// described by the test script documentation.
//
// The supplied Fill.tst script, which comes with no compare file, is designed
// to do two things:
// - Load the Fill.hack program
// - Remind you to select 'no animation', and then test the program
//   interactively by pressing and releasing some keyboard keys

// Put your code here.

//while (true) {
//    if (KBD != 0) {
//        color = -1;
//    } else {
//        color = 0;
//    }
//
//    for (int i = 0; i < 8192; i++) {
//        RAM[SCREEN + i] = color;
//    }
//}

(CHECK_KEYBOARD)
@KBD
D=M
@BLACK
D;JNE

//else continue with white 
@color 
M=0
@FILL
0;JMP

(BLACK)
@color
M=-1
@FILL
0;JMP

//initialize the screen pointer.
//SCREEN starts at RAM[16384].
(FILL)
@SCREEN
D=A
@address
M=D

(LOOP)

//Load the selected color.
@color
D=M

//write the color to the current screen address.
@address
A=M
M=D
//next cell
@address
M=M+1

//check if address reached SCREEN + 8192 =16384+8192=24576=KBD
@address
D=M
@KBD
D=D-A


//If the entire screen is filled,
//return to checking the keyboard state
@CHECK_KEYBOARD
D;JEQ


//otherwise, continue filling the screen
@LOOP
0;JMP