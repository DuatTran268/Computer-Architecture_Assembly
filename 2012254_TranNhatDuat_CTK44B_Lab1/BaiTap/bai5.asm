.model
.stack
.data
    thongbao1 db 'Nhap ky tu thu nhat:  $'
    thongbao2 db 'Nhap ky tu thu hai:  $'
    thongbao3 db 'Nhap ky tu tong:  $'
    kyTu1 db ?
    kyTu2 db ?
    kyTuTong db ?
.code
    mov ax, @data
    mov ds, ax
    
    ; xuat cau thong bao 1
    mov ah, 9
    lea dx, thongbao1
    int 21h
    
    ;nhap vao ky tu thu nhat
    mov ah, 1
    int 21h
    mov kyTu1, al
    
    ; xuat cau thong bao 2
    mov ah, 9
    lea dx, thongbao2
    int 21h
    
    ; nhap vao ky tu thu 2
    mov ah, 1
    int 21h  
    
    mov kyTu2, al
    
    mov al, kyTu1
    add al, kyTu2
    mov kyTuTong, al
    
    ; xuat cau thong bao 3
    mov ah, 9
    lea dx, thongbao3
    int 21h
    
    mov ah, 2
    mov dl, kyTuTong
    int 21h
    
    mov ah, 4ch
    int 21h
end