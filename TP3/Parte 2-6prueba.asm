
ORG 1000H
MSJ DB ?
FIN DB ?

ORG 3000H
EFEDIEZ:MOV CL, 1
        MOV AL, 11111100B
        OUT IMR, AL
        MOV AL, 1
        OUT COMP, AL
        MOV AL, 0
        OUT CONT, AL
        MOV AL, 20
        OUT EOI, AL
        IRET

ORG 3100H
TIMER:PUSH AX
      MOV AL, 1
      INT 7
      CMP MSJ, 30H
      JNZ OTRO
      MOV FIN, 1
      MOV AL, 0FFH
      OUT IMR, AL
OTRO: DEC MSJ
      MOV AL, 0
      OUT CONT, AL
      MOV AL, 20
      OUT EOI, AL
      POP AX
      IRET

ORG 2000H
MOV BX, 20
MOV AX, EFEDIEZ
MOV [BX], AX
MOV BX, 16
MOV AX, TIMER
MOV [BX], AX
MOV BX, OFFSET MSJ
INT 6
MOV AH, 0
MOV DL, [BX]
SUB DL, 30H
CLI
MOV AL, 11111110B
OUT IMR, AL
MOV AL, 5
OUT INT0, AL
MOV AL, 4
OUT INT1, AL
STI

MOV CL, 0
LOOP:CMP CL, 1
     JNZ LOOP
     
LOOP1:CMP FIN, 1
      JNZ LOOP1

INT 0
END