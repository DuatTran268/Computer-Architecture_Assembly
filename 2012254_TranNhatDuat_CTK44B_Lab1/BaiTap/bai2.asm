; bai 2 
.model small
.stack
.data
    thongbao1 db 'Hay nhap mot ky tu: $'
    thongbao2 db 10, 13, 'Ky tu da nhap: $'
    kytu db ?
.code
    mov ax, @data
    mov ds, ax
    
    ; xuat cau thong bao 1
    mov ah, 9
    lea dx, thongbao1
    int 21h
    
    ;Nhap vao 1 ky tu
    mov ah, 1
    int 21h
    
    ;chuyen ki tu vua nhap vao tro ky tu de luu tru
    mov kyTu, al
    
    ;xuat cau thong bao 2
    mov ah, 9
    lea dx, thongbao2
    int 21h
    
    ; xuat ky tu vua nhap vao ra man hinh
    mov ah, 2
    mov dl, kyTu
    int 21h   
    
    ; thoat chuong trinh
    mov ah, 4ch
    int 21h
end    