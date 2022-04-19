.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 10, 13, 'Nhap vao 1 chu cai thuong:  $'
    TB2 DB 10, 13, 'Chu hoa tuong ung la:  $'
    END1 DB 10, 13, 'Bam 1 phim bat ki de thoat!$'
    KyTu DB ?
    
.code
    ; lay du lieu data vao ds
    MOV AX, @data
    MOV DS, AX


input: 
    ; xuat thong bao nhap 1 ky tu
    MOV AH, 9
    LEA DX, TB1
    INT 21h
    
    ; nhap vao 1 ky tu
    MOV AH, 7
    INT 21h
    
    CMP AL, 'a'
    JB input
    CMP AL, 'z'
    JA input
    
    MOV KyTu, AL
    
    ; xuat thong bao ket qua
    MOV AH, 9
    LEA DX, TB2
    INT 21h
    
    ; xuat ki tu hoa tuong ung
    MOV DL, KyTu
    SUB DL, 20h
    MOV AH, 2
    INT 21h
    
    ; thoat chuong trinh
    MOV AH, 9
    LEA DX, END1
    INT 21h
    
    MOV AH, 7
    INT 21h
    
    MOV AH, 4ch
    INT 21h
       
 
 END   