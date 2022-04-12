; chuong trinh nhap vao 1 chuoi ky tu , hien thi theo thu tu nguoc lai
.MODEL SMALL
.STACK 100H
.DATA
    TB1 DB 'Nhap mot chuoi ky tu ( ket thuc bang Enter):  $'
    TB2 DB 13, 10, 'Chuoi nguoc: $'

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, TB1
    INT 21H
    
    MOV CX, 0
    MOV AH, 1
    
    CALL NHAPCHUOI
  
NHAPCHUOI PROC
    POP BX
    INT 21H
    CMP AL, 13
    JE XUONGDONG
    MOV BL, AL
    PUSH BX
    CALL NHAPCHUOI
    RET
NHAPCHUOI  ENDP
  
  
XUONGDONG:
    MOV AH, 9
    LEA DX, TB2
    INT 21H
    JMP XUATCHUOI
    
XUATCHUOI:
    POP BX
    CMP SP, 100H
    JG KETTHUC
    MOV AH, 2
    MOV DX, BX
    INT 21H
    LOOP XUATCHUOI
    
KETTHUC:
    MOV AH, 4CH
    INT 21H
    
END