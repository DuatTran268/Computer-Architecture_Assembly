.MODEL SMALL
.STACK
.DATA

    TB1 DB 'Nhap vao so nhi phan:  $'
    TB2 DB 13, 10, 'So nhi phan da nhap: $'
    KT DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ; NHAP VAO SO NHI PHAN
    MOV AH, 9
    LEA DX, TB1
    INT 21h
    
    MOV CX, 16
    XOR BX, BX
NEXT:
    MOV AH, 1
    INT 21h
    CMP AL, 13
    JE XUAT
    
    AND AL, 0FH
    SHL BX, 1
    
    OR BL, AL
    LOOP NEXT
    
XUAT:
    MOV AH, 9
    LEA DX, TB2
    INT 21h
    
    MOV CX, 16
    MOV AH, 2
LAP:
    SHL BX, 1
    JC XUAT1
    
    MOV DL, '0'
    JMP THEN
XUAT1:
    MOV DL, '1'
    
THEN:
    INT 21h
    LOOP LAP
    
THOAT:
    MOV AH, 4CH
    INT 21h
    
END