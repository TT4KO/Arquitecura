ORG 3000H
IZQUIERDA: ADD AL, AL
           ADC AL, 0
           RET
                     
ORG 3200H
DERECHA: MOV AL, CL
         ADD AL, AL
         ADC AL, 0
         DEC DL
         JNZ DERECHA
         RET

ORG 2000H
MOV AL, 0
OUT CB, AL
MOV AL, 1
LOOP: OUT PB, AL
      CALL IZQUIERDA
      CMP AL, 10000000B
      JNZ LOOP
LOOPD:MOV DL, 8
      MOV CL, 6
      OUT PB, AL
      CALL DERECHA
      DEC CL
      CMP AL, 1
      JNZ LOOPD
      JMP LOOP
INT 0
END
