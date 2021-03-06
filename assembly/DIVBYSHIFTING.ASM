
;The program simulates dividing a four bit number stored in 
;register B by a four bit number stored in register C. It stores 
;the result in register D and remainder in register E. It uses
;the method of shifting and subtracting as described in class.

jmp start

;data


;code
start: nop

MVI B, 0h ;SET VALUE OF NUMERATOR
MVI C, 0h ;SET VALUE OF DENOMINATOR
MVI E, 0000B ;WILL BE REMAINDER
MVI D, 0000B ;WILL BE RESULT

MVI H, 00H ;RESET ERROR MESSAGE OF "DEAD"
MVI L, 00H

MVI L, 8H ;LOOP COUNTER


MOV A, C
CPI 0H
JNZ LOOP
MVI H, 0DEH
MVI L, 0ADH
hlt

LOOP: NOP
DCR L ;DECREMENT LOOP COUNTER

MOV A, E
RLC	;SHIFT THE REMAINING FROM SUBSTRACTIONS (LONG DIVISION THINGY)
MOV E, A

MOV A, B
RLC	;SHIFT THE NUMERATOR
MOV B, A
JNC ZERO
INR E	;IF CURRENT DIGIT OF NUMERATOR = 1, ADD 1 TO THE REMAINING FROM SUBSTRACTIONS
ZERO: NOP 

MOV A, E
CMP C	;IF THE REMAINING FROM SUBSTRACTIONS => THE DENOMINATOR, 
JC NOSUB     ;SUBSTRACT DENOMINATOR FROM IT & ADD 1 TO THE ANSWER
SUB C
MOV E, A
INR D
NOSUB: NOP

MOV A, D
RLC	;SHIFT THE ANSWER
MOV D, A

MVI A, 0H
CMP L	;IF LOOP IS NOT DONE, GO TO TOP OF LOOP
JC LOOP

MOV A, D
RRC	;UNDO LAST SHIFT TO ANSWER
MOV D, A



HLT