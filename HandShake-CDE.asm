ORG 1000H
MSJ DB "DIOS SABEE"
FIN DW ?

ORG 3000H

ORG 2000H
IN AL, ESTADO
AND AL, 07FH
OUT ESTADO, AL
MOV BX, OFFSET MSJ
POLL:IN AL, ESTADO
     AND AL, 1
     JNZ POLL
     MOV AL, [BX]
     OUT DATO, AL
     INC BX
     CMP BX, OFFSET FIN
     JNZ POLL
INT 0
END
