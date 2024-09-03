PA equ 30h
PB EQU 31h
CA equ 32h
CB equ 33h

ORG 1000H
MSJ DB "A"

ORG 3000H
INI_PIO: 
MOV AL, 11111101b
OUT CA, AL

MOV AL, 0
OUT CB, AL
RET

ORG 3100H
POLL: IN AL, PA
      AND AL, 01H
      JNZ POLL
      RET

ORG 3200H
FLANCO:IN AL, PA 
       OR AL, 02H
       OUT PA, AL 
       
       IN AL, PA
       AND AL, 1
       OUT PA, AL
RET

ORG 3300H
IMPRIMIR: MOV BX, OFFSET MSJ
          MOV AL, [BX]
          OUT PB, AL
RET

ORG 2000H
MOV AX, 0
CALL INI_PIO
CALL POLL
CALL IMPRIMIR
CALL FLANCO
INT 0
END
