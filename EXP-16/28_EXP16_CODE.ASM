ASSUME DS:DATA,CS:CODE
DATA SEGMENT
MSG1 DB 0AH,0DH,"ENTER THE NO. OF ELEMENTS:$"
MSG2 DB 0AH,0DH,"FIBONACCI SERIES:$"
STR DB 50 DUP("$")
DATA ENDS

CODE SEGMENT
START:
      MOV AX,DATA
      MOV DS,AX
      LEA DX,MSG1
      MOV AH,09H
      INT 21H

      MOV AH,01H
      INT 21H
      MOV CH,AL
      SUB CH,30H

      LEA DX,MSG2
      MOV AH,09H
      INT 21H

      MOV DL,30H
      MOV AH,02H
      INT 21H

      MOV AL,01H
      MOV BL,01H

      MOV DL,AL
      ADD DL,30H
      MOV AH,02H
      INT 21H

      MOV DL,20H
      MOV AH,02H
      INT 21H

      MOV DL,30H
      MOV AH,02H
      INT 21H

      MOV DL,BL
      ADD DL,30H
      MOV AH,02H
      INT 21H

      MOV DL,20H
      MOV AH,02H
      INT 21H

      MOV AL,01H
      MOV BL,01H
      MOV BH,02H
      LEA SI,STR

L1:   MOV CL,BL
      ADD BL,AL
      MOV AL,CL

      MOV [SI],BL
      INC SI
      INC BH
      CMP CH,BH
      JNE L1

      MOV BH,02H
      LEA SI,STR

L2:   XOR AX,AX
      MOV AL,[SI]
      MOV BL,10D
      DIV BL
      MOV CL,AH
      MOV DL,AL
      ADD DL,30H
      MOV AH,02H
      INT 21H
      MOV DL,CL
      ADD DL,30H
      MOV AH,02H
      INT 21H
      MOV DL,32D
      MOV AH,02H
      INT 21H
      INC SI
      INC BH
      CMP CH,BH
      JNE L2

      MOV AH,4CH
      INT 21H

CODE ENDS
END START
