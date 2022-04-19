.MODEL SMALL
.STACK 100H
.DATA
    tb1 DB 10, 13, 'Moi ban nhap vao 1 ky tu:  $'
    tb2 DB 10, 13, '5 ky tu dung truoc ky tu vua nhap la:  $';
    So DB ?
 
.code
    ; lay du lieu data
    MOV AX, @data
    MOV DS, AX
    
    ; xuat thong bao de nguoi dung nhap vao 1 ky tu
    MOV AH, 9
    LEA DX, tb1
    INT 21h
    
    ; nhap vao 1 ky tu
    MOV AH, 1
    INT 21h
    MOV So, AL
    
    ; xuat thong bao ket qua
    MOV AH, 9
    LEA DX, tb2
    INT 21h
    
    SUB So, 5
    MOV CX, 5   
PRINT:
    MOV AH, 2
    MOV DL, So
    INT 21h
    
    MOV DL, 0ah
    INT 21h
    INC so
    
    LOOP print
    
    ; thoat chuong trinh
    MOV AH, 4ch
    INT 21h    
END