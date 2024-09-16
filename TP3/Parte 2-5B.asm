IDTIMER EQU 5

ORG 1000H
MSJ DB "AUIN MA WE"
FIN DB ?

ORG 3000H
TEMPO: MOV BX, OFFSET MSJ
       MOV AL, OFFSET FIN - OFFSET MSJ
       INT 7
       INC DX
       MOV AL, 20H
       OUT EOI, AL
       IRET

ORG 2000H
MOV BX, 20
MOV AX, TEMPO
MOV [BX], AX

CLI
MOV AL, 11111101B
OUT IMR, AL

MOV AL, IDTIMER
OUT INT1, AL

MOV AL, 10
OUT COMP, AL
STI
MOV AL, 0
OUT CONT, AL
MOV DX, 0

LOOP: CMP DX, 1
      JNZ LOOP

INT 0
END