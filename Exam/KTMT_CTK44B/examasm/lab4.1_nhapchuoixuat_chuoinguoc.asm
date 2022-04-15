.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 'Nhap mot chuoi ky tu ( ket thuc bang Enter):  $'
    TB2 DB 13, 10, 'Chuoi nguoc: $'
.CODE
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, TB1
    INT 21h
    
    MOV CX, 0
    MOV AH, 1
    
    CALL NhapChuoi
    
NhapChuoi PROC
        POP BX
        INT 21h
        CMP AL, 13
        JE XuongDong
        MOV BL, AL
        PUSH BX
        CALL NhapChuoi
        RET
        
NhapChuoi ENDP
    
XuongDong:
        MOV AH, 9
        LEA DX, TB2
        INT 21h
        JMP XuatChuoi
        
XuatChuoi:
    POP BX
    CMP SP, 100h
    JG KetThuc
    MOV AH, 2
    MOV DX, BX
    INT 21h
    LOOP XuatChuoi
KetThuc:
    MOV AH, 4ch
    INT 21h
    
  
END     