.model small
.stack 100h
.data
    
    Tb1 db 10, 13, 'Moi ban nhap vao 1 ky tu:  $'
    Tb2 db 10, 13, '5 ky tu dung truoc ky tu vua nhap la:  $'
    So db ?
    
.code
    ;lay du lieu data va ds
    mov ax, @data
    mov ds, ax
    
    ; xuat thong bao de nguoi dung nhap vao 1 ky tu
    mov ah, 9
    lea dx, Tb1
    int 21h
    
    ; nhap vao 1 ky tu
    mov ah, 1
    int 21h
    
    mov So, al
    
    ; xuat thong bao ket qua nha
    mov ah, 9
    lea dx, Tb2
    int 21h
    
    sub So, 5
    mov cx, 5
 
PRINT:
    mov ah, 2
    mov dl, So
    int 21h
    
    mov dl, 0ah
    int 21h
    
    inc So
    
    loop PRINT
    
    ; thoat chuong trinh
    mov ah, 4ch
    int 21h
    

end    