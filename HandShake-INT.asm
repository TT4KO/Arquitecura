ORG 1000H
MSJ DB "DIOS SABEE"
FIN DW ?

ORG 3000H
IMPRIMIR: PUSH AX
          MOV AL, [BX]
          OUT DATO, AL
          INC BX
          CMP BX, OFFSET FIN
          JNZ CONTINUAR
          IN AL, ESTADO
          AND AL, 07FH
          OUT ESTADO, AL
          MOV AL, 0FFH
          OUT IMR, AL
          INC CL
CONTINUAR:MOV AL, 20
          OUT EOI, AL
          POP AX
          IRET
          
ORG 2000H
MOV BX, 16
MOV AX, IMPRIMIR
MOV [BX], AX
MOV BX, OFFSET MSJ
CLI
MOV AL, 11111011B
OUT IMR, AL

MOV AL, 4
OUT INT2, AL
STI
IN AL, ESTADO
OR AL, 80H
OUT ESTADO, AL
MOV CL, 0
LOOP: CMP CL, 1
      JNZ LOOP
      
INT 0
END
