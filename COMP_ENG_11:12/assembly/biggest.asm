
;PLACES BIGGEST NUMBER FROM B AND C IN D

jmp start

;data


;code
start: nop

MVI B, 11H; SET VALUE FOR B
MVI C, 10H; SET VALUE FOR C

MOV A, B ;MOVES B VALUE TO ACCUMULTOR
CMP C; COMPARES VALUES OF B & C
JC CBIGGER ; IF B<C, JUMP TO CBIGGER LABEL

MOV D, B; IF B>=C MOVE B VALUE TO D
JMP DONE; SKIP LABEL CBIGGER

CBIGGER: MOV D, C; IF B<C, MOVE C VALUE TO D

DONE: NOP
hlt