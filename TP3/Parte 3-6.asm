ORG 1000H
MSJ DB "INGRESE EL NUMERO DEL 1 AL 9: "
NUM DB ?

ORG 3000H
LEERDIGITO:INT 7
OTRO:      MOV BX, OFFSET NUM
           INT 6
           MOV AL, NUM
           CMP AL, '0'
           JC OTRO
           CMP AL,  '9'
           JNC OTRO
           RET
           

ORG 3100H
COMENZAR: INC CL
          MOV AL, 20
          OUT EOI, AL
          IRET
ORG 3200H
DESCENDER:MOV BX, SP
          ADD BX, 2
          MOV AX, [BX]
          MOV BX, AX
          
POLL:     IN AL, ESTADO
          AND AL, 1
          JNZ POLL
          
          MOV AL, [BX]
          OUT DATO, AL
          DEC WORD PTR [BX]
          DEC DL
          JNZ POLL    
          RET

ORG 2000H
MOV BX, 20
MOV AX, COMENZAR
MOV [BX], AX
IN AL, ESTADO
AND AL, 07FH
OUT ESTADO, AL
CLI
MOV AL, 11111110B
OUT IMR, AL
MOV AL, 5
OUT INT0, AL
STI
MOV BX, OFFSET MSJ
MOV AL, OFFSET NUM - OFFSET MSJ
CALL LEERDIGITO
MOV CL, 0
MOV DL, [BX]
SUB DL, 30H
PUSH BX
LOOP: CMP CL, 1
      JNZ LOOP
CALL DESCENDER
POP BX
INT 0
END
