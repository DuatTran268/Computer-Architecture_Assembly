.model small
.stack 100h
.data  
    TB1 db 10, 13, 'Ban hay nhap vao 1 chu cai thuong: $'
    TB2 db 10, 13, 'Chu hoa tuong ung la:  $'
    END1 db 10, 13, 'Bam 1 phim bat ki de thoat!$'
    
    kytu db ?
.code
    ; lay du lieu data vao ds
    mov ax, @data
    mov ds, ax
input:
    ; xuat thong bao nhap 1 ky tu
    mov ah, 9
    lea dx, TB1
    int 21h
    
    ; nhap vao 1 ky tu 
    mov ah, 7
    int 21h
    
    cmp al, 'a'
    jb input
    cmp al, 'z'
    ja input
    
    mov kytu, al
    
    ; xuat thong bao ket qua
    mov ah, 9
    lea dx, TB2
    int 21h
    
    ; xuat ki tu  hoa tuong ung
    mov dl, kytu
    sub dl, 20h
    mov ah, 2
    int 21h
    
    ; thoat chuong trinh
    mov ah, 9
    lea dx, END1
    int 21h
    
    mov ah, 7
    int 21h
    
    mov ah, 4ch
    int 21h
end  