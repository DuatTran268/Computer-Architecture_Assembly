.model small
.stack
.data
    thongbao1 db 'Hay nhap mot ky tu: $!'
    thongbao2 db 13,10, 'Ky tu dung truoc: $'
    thongbao3 db 13,10, 'Ky tu dung sau: $'
    kyTu db ?
.code
    mov ax, @data
    mov ds, ax
    
    ; xuat thong bao 1
    mov ah, 9
    lea dx, thongbao1
    int 21h
    
    mov ah, 1
    int 21h
    
    ; chuyen ky tu vua nhap vao kyTu de luu tru
    mov kyTu, al
    
    ;xuat cau thong bao 2
    mov ah, 9
    lea dx, thongbao2
    int 21h
    
    ;xuat ky tu truoc
    mov ah, 2
    ; dua ky tu vao dl de xuat ra
    mov dl, kyTu
    dec dl   
    int 21h
    
    ;xuat cau thong bao 3
    mov ah, 9
    lea dx, thongbao3
    int 21h
    
    ; xuat ky tu sau
    mov ah, 2
    mov dl, kyTu
    inc dl
    int 21h
    
    mov ah, 4ch     ; thoat chuong trinh
    int 21h
    
    
end