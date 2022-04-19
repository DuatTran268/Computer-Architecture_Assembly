.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 10, 13, 'Nhap vao mot ky tu:  $'
    TB2 DB 10, 13, '5 ky tu dung truoc la: $'
    TB3 DB 10, 13, '5 ky tu dung sau la:  $'
    
    KyTu DB ?
    
.CODE
    ; lay du lieu tu data vao ds
    MOV AX, @data
    MOV DS, AX
    
    ; xuat thong bao nhap vao 1 ky tu
    MOV AH, 9
    LEA DX, TB1
    INT 21h
    
    ; nhap vao 1 ky tu
    MOV AH, 1
    INT 21h
    MOV KyTu, AL
    
    ; xuat thong bao 5 ky tu dung truoc
    MOV AH, 9
    LEA DX, TB2
    INT 21h
    
    ; ky tu dung truoc dau tien
    MOV DL, KyTu
    SUB DL, 5
    MOV CX, 5
    
    MOV AH, 2
    
    Xuat_Truoc:
        INT 21h
        INC DL
        LOOP Xuat_Truoc
        
    ; xuat thong bao 5 ky tu dung sau
    MOV AH, 9
    LEA DX, TB3
    INT 21h
    
    MOV DL, KyTu
    INC DL
    MOV CX, 5
    
    MOV AH, 2
    
    Xuat_Sau:
        INT 21h
        INC DL
        LOOP Xuat_Sau
        
    ; thoat chuong trinh
    MOV AH, 4ch
    INT 21h
END