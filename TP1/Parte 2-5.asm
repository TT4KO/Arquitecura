ORG 1000H
CLAVE DB "Ingrese contrasena: "
BIEN DB " ACCESO PERMITIDO "
MAL DB " ACCESO DENEGADO "
FIN DB " ACCESO BLOQUEADO "
ERRORES DB 0
PASW DB "raul"
CONTRA DB ?


ORG 2000H
MOV BX, OFFSET CLAVE
MOV AL, OFFSET BIEN - OFFSET CLAVE
INT 7
MOV CX, 4
MOV BX, OFFSET CONTRA
OTRO:INT 6
     INC BX
     DEC CL
     JNZ OTRO
     MOV DX, 3
ACA: MOV BX, OFFSET PASW
     ADD BX, DX
     MOV AL, [BX]
     MOV BX, OFFSET CONTRA
     ADD BX, DX
     MOV AH, [BX]
     CMP AL, AH
     JNZ ERROR
     DEC DX
     JNZ ACA
     MOV BX, OFFSET BIEN
     MOV AL, OFFSET MAL - OFFSET BIEN
     int 7
     JMP TERMINAR
ERROR:INC ERRORES
      PUSH BX
      PUSH AX
      MOV BX, OFFSET MAL
      MOV AL, OFFSET FIN - OFFSET MAL
      INT 7
      POP AX
      POP BX
      CMP ERRORES, 3
      JNZ ACA
      MOV BX, OFFSET FIN
      MOV AL, OFFSET ERRORES - OFFSET FIN
      INT 7
TERMINAR:INT 0
         END