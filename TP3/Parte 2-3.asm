ORG 1000H
IP_F10 DW RINT0

ORG 3000H
RINT0: PUSH AX
      MOV AL, 20H
      OUT EOI, AL
      INC DX
      POP AX
      IRET
ORG 2000H
CLI 
MOV AL, 0FEH
OUT IMR, AL
MOV AL, 3
OUT INT0, AL
MOV DX, 0
STI
LAZO: JMP LAZO
INT 0
END