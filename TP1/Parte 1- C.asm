{Escribir un programa que convierta un carácter de mayúsculas a
minúsculas. El carácter está almacenado en la variable C. Asumir que el carácter es una mayúscula.
Pista: Las mayúsculas y las minúsculas están en el mismo orden en el ASCII, y por ende la distancia
entre, por ejemplo, la “A” y la “a” es la misma que la distancia entre la “Z” y la “z”} 

ORG 1000H
NUM1 DW 'A'
RES DB ?
LETRA1 db 61
LETRAA db 41

ORG 3000H
ACA: MOV BX, SP
     ADD BX, 2
     MOV AL, [BX]
     CMP AL, 41H
     JC FIN
     CMP AL, 5AH
     JNC FIN
     ADD AL, 20H
     MOV DL, AL   
FIN: RET
     
ORG 2000H
MOV BX, OFFSET num1
MOV AL, [BX]
PUSH AX
CALL ACA
POP AX
MOV RES, DL
HLT
end
