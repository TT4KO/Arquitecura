ORG 1000H
MSJ DB "APUCHARRALE AL STRAR: "
FINMSJ DB ?
EMPEZAR DB ?
MENSAJE DB ?

ORG 3000H
CONFI:MOV AL, 11111101B
      OUT CA, AL
      MOV AL, 0
      OUT CB, AL
      RET

ORG 3100H
TIMER:  INC CL
        MOV AL, 20
        OUT EOI, AL
        IRET

          
ORG 2000H
CALL CONFI
MOV BX, 20
MOV AX, TIMER
MOV [BX], AX
MOV BX, OFFSET MSJ
MOV AL, OFFSET FINMSJ - OFFSET MSJ
INT 7
CLI
MOV AL, 11111110B
OUT IMR, AL
MOV AL, 5
OUT INT0, AL
STI
MOV CL, 0
LOOP: CMP CL, 1
      JNZ LOOP
MOV CL, 10
MOV BX, OFFSET EMPEZAR
OTRO:INT 6
     MOV AX, [BX]
     INC BX
     DEC CL
     CMP CL, 0
     JNZ OTRO
MOV AX, OFFSET EMPEZAR
MOV CL, 10
PUSH AX
POLL:IN AL, PA
     AND AL, 1
     JNZ POLL
     MOV BX, SP
     
     MOV AX, [BX]
     MOV BX, AX
MAS: MOV AX, [BX]
     OUT PB, AL
     INC BX
     IN AL, PA
     OR AL, 00000010B
     OUT PA, AL
     AND AL, 11111101B
     OUT PA, AL
     DEC CL
     JNZ POLL
POP AX
INT 0
END
