.MODEL SMALL
.STACK 100h
.DATA
    tb1 DB 13, 10, 'Moi ban nhap mot ky tu:  $'
    tb2 DB 13, 10, '5 ky tu ke tiep la:  $'
    bien DB ?
    endLine DB 10, '$'
.CODE 
    ; luu du lieu tu data
    MOV AX, @data
    MOV DS, AX
INPUT:
    ; xuat thong bao nguoi dung nhap vao 1 ky tu
    MOV AH, 9
    LEA DX, tb1
    INT 21h ; xuat 
    ; nguoi dung nhap vao mot ky tu 
    MOV AH, 1
    INT 21h
    
    MOV Bien , AL   
    ; xuat ra ket qua nguoi dung nhap
    MOV AH, 9
    LEA DX, tb2
    INT 21h
    
    ; xuat ra 5 ky tu
    MOV CX, 5
    
PRINT:
    MOV AH, 2
    ADD Bien, 1h
    MOV DL, Bien
    INT 21h
    MOV AH, 9
    LEA DX, endLine
    INT 21h
    
    LOOP Print
    ; thoat chuong trinh
    MOV AH, 4ch
    INT 21h 
   
END 