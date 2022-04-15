.model small
.stack 100h
.data
    tb1 DB 10, 13, 'Nhap vao mot ky tu:  $'
    tb2 DB 10, 13, '5 ky tu ke tiep la: $'
    
    kytu DB ?
.code
    MOV AX, @data
    MOV DS, AX
    
    ; xuat thong bao nhap vao 1 ky tu
    MOV AH, 9
    LEA DX, tb1
    INT 21h
    
    ; nhap vao 1 ky tu
    MOV AH, 1
    INT 21h
    MOV kytu, AL
    
    ; xuat thong bao 5 ky tu dung sau
    MOV AH, 9
    LEA DX, tb2
    INT 21h
    
    MOV DL, kytu
    INC DL
    MOV CX, 5
    
    MOV AH, 2
    
    PRINT_AFTER:
        INT 21h
        INC DL
        LOOP PRINT_AFTER
        
    ; thoat chuong trinh
    MOV AH, 4ch
    INT 21h
    
END 