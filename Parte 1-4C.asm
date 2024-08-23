(Modificar el ejercicio b) que muestra los dígitos, para que cada dígito se muestre en una línea
separada.
Pista: El código ASCII del carácter de nueva línea es el 10, comúnmente llamado “\n” o LF (“line
feed” por sus siglas en inglés y porque se usaba en impresoras donde había que “alimentar” una
nueva línea)

ORG 1000H
MSJ DB "A"
BARRA DB  "/"

ORG 2000H
loop:MOV BX, OFFSET MSJ
     MOV AL, 1
     INT 7
     MOV BX, OFFSET BARRA
     INT 7
     MOV BX, OFFSET MSJ
     INC BYTE PTR [BX]
     CMP BYTE PTR [BX], 'Z'
     JNZ LOOP
INT 0
END
