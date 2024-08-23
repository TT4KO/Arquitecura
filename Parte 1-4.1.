Escribir un programa que muestre en pantalla las letras mayúsculas (“A” a la “Z”).
Pista: Podés buscar los códigos de la “A” y la “Z” en una tabla de códigos ascii. No utilizar un vector.
Usar una sola variable de tipo db, e incrementar el valor de esa variable antes de imprimir

ORG 1000H
MSJ DB "A"

ORG 2000H
MOV BX, OFFSET MSJ
MOV AL, 1
LOOP: INT 7
      INC BYTE PTR [BX]
      CMP BYTE PTR [BX], 'Z'
      JNZ LOOP
INT 0
END
