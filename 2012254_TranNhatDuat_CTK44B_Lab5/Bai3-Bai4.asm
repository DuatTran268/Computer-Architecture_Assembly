.MODEL
.STACK 
.DATA

    TB1 DB 13, 10, 'Nhap so thap luc phan (toi da 4 ky so): ABCD:  $'
    TB2 DB 13, 10, 'Xuat so thap luc phan:  $'
    ERROR DB 13, 10, 'Ban da nhap sai$'
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, TB1
    MOV AH, 9
    INT 21h
    
    XOR BX, BX
    MOV AH, 1
    MOV CL, 4
    
FOR1:
    INT 21h
    
    CMP AL, 0DH
    JE END_FOR
    
    CMP AL, 30H
    JB NHAPSAI
    
    CMP AL,'9'
    JBE NUMBER
    
    CMP AL, 'A'
    JBE NHAPSAI
    
    CMP AL, 'F'
    JBE LETTER
    
    JMP NHAPSAI
    
NUMBER:
    SUB AL, 48
    JMP SHIFT
    
LETTER: 
    SUB AL, 37H
SHIFT:
    SHL BX, 4
    OR BL, AL
    JMP LAP
    
LAP:
    LOOP FOR1
    JMP END_FOR
NHAPSAI:
    MOV AH, 9
    LEA DX, ERROR
    INT 21H
    JMP KETTHUC
    
END_FOR:
    MOV AH, 9
    LEA DX, TB2
    INT 21H
    
PRINTN:
    MOV CX, 4
    MOV AH, 2
    
FOR:
    MOV DL, BL
    SHR DL, 4
    
    CMP DL, 10
    JB NUM
    JAE LETTER2
    
    NUM:
    ADD DL, 48
    INT 21H
    JMP END_OF_LOOP2
    
LETTER2:
    ADD DL, 55
    INT 21H
    
END_OF_LOOP2:
    ROL BX, 4
    LOOP FOR
    
KETTHUC:
    MOV AH, 4CH
    INT 21H
 
END
         
        