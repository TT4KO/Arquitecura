El pasaje de parámetros más usual suele ser por valor y por registro. No obstante, en algunas ocasiones
también se utilizan pasajes de parámetros más avanzados que permiten más flexibilidad o eficiencia.
Escribir un programa que tenga dos valores de 8 bits A y B almacenados en su memoria y realice la
multiplicación de A y B. El resultado se debe guardar en la variable RES de 16 bits, o sea que RES = A ⨯ B.
Para hacerlo, implementar una subrutina MUL:

org 1000h
NUM1 DB 4
NUM2 DB 3
RES DB ?

ORG 2000H
MOV DX, 0
MOV AL, NUM1
MOV AH, NUM2
LOOP:ADD DL, AL
     DEC AH
     JNZ LOOP
MOV RES, DL
INT 0
END.

