.model small
.stack 100h
.data
    tb db 'Cac ky tu hoa trong bang ma asci:  $'
.code  
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb
    int 21h
    
    mov ah, 2   ; hien thi ky tu
    mov cx, 26  ; so ky tu hien thi
    mov dl, 41h ; ky tu bat dau
; vong lap
PrintLoop:
    int 21h
    inc dl  ; tang len 1
    loop PrintLoop
    
    ;thoat chuong trinh
    mov ah,4ch
    int 21h
end