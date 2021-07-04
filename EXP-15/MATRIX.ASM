ASSUME DS:DATA,CS:CODE
DATA SEGMENT
MSG1 DB 0AH,0DH,"ENTER NO. OF ROWS:$"
MSG2 DB 0AH,0DH,"ENTER NO. OF COLUMNS:$"
MSG3 DB 0AH,0DH,"ENTER MATRIX 1:$"
MSG4 DB 0AH,0DH,"ENTER MATRIX 2:$"
MSG5 DB 0AH,0DH,"RESULTANT MATRIX:$"
M1 DB 50 DUP("$")
M2 DB 50 DUP("$")
Z DB 0
DATA ENDS

CODE SEGMENT
START:
      MOV AX,DATA
      MOV DS,AX
      XOR CX,CX
      XOR DX,DX
      LEA DX,MSG1
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H
      MOV BL,AL

      LEA DX,MSG2
      MOV AH,09H
      INT 21H
      MOV AH,01H
      INT 21H

      LEA DX,MSG3
      MOV AH,09H
      INT 21H
      LEA SI,M1

L1:   MOV AH,01H
      INT 21H
      CMP AL,0DH
      JE L2
      CMP AL,20H
      JE L1
      MOV [SI],AL
      INC SI
      INC CL
      JMP L1

L2:   LEA DX,MSG4
      MOV AH,09H
      INT 21H
      LEA SI,M1
L3:   MOV AH,01H
      INT 21H
      CMP AL,0DH
      JE L4
      CMP AL,20H
      JE L3
      SUB AL,96D
      ADD [SI],AL
      INC SI
      JMP L3

L4:   MOV AL,Z
      LEA SI,M1

      LEA DX,MSG5
      MOV AH,09H
      INT 21H


RESULT:   MOV AL,[SI]
          INC CH
          CMP CH,CL
          JG EXIT
          MOV AL,[SI]
          XOR AH,AH
          XOR BX,BX
          MOV BL,10D
          DIV BL
          MOV BH,AH
          MOV DL,AL
          ADD DL,30H
          MOV AH,02H
          INT 21H
          MOV DL,BH
          ADD DL,30H
          MOV AH,02H
          INT 21H
          MOV DL,32D
          MOV AH,02H
          INT 21H
          INT 21H
          INC SI
          JMP RESULT


EXIT: MOV AH,4CH
      INT 21H

CODE ENDS
END START
