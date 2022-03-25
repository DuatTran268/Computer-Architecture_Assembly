;Nhap xuat so thap luc phan ( hex)
.model small
.data 
    TB DB 13,10, 'So Hexa vua nhap:  $'
.stack 100h
.code
;Nhap so thap luc phan chua vao bx

    xor bx, bx
    mov cl, 4   ; dich chuyen 4 bit
    mov ah, 1
N2:
    int 21h
    cmp al, 13
    je N8
    cmp al, 39h     ; ky tu la chu so
    jg Letter
    and al, 0Fh     ; doi thanh tri
    jmp Shift       ; dua vao BX
    
Letter:
    sub al, 37h     ; doi chu ra tri
Shift:
    shl bx, cl
    or bl, al
    jmp N2
N8:
    ; xuat so thap luc phan trong bx
    mov ax,@DATA
    mov ds, ax,
    lea dx, tb
    mov ah, 9
    int 21h
    mov cx, 4
    
PrintHex:
    mov dl, bh
    shr dl, 4
    cmp dl, 9
    jg PrintLetter
    or dl, 30h
    mov ah, 2
    int 21h
    jmp Exit
PrintLetter:
    add dl, 37h
    mov ah, 2
    int 21h
Exit:
    shl bx, 4
    loop PrintHex
   
   
    ; dung chuong trinh
    mov ah, 4ch
    int 21h
END