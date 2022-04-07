.model small
.stack 100h
.data
    Tb1 db 10, 13, 'Nhap vao mot ky tu: $'
    Tb2 db 10, 13, '5 ky tu dung truoc la:  $'
    Tb3 db 10, 13, '5 kt tu dung sau:  $'
    
    KyTu DB ?

.code
    ; lay du lieu tu DATA vao ds
    mov ax, @data
    mov ds, ax
    
    ;xuat thong bao nhap vao 1 ky tu
    mov ah, 9
    lea dx, Tb1
    int 21h
    
    ;nhap vao 1 ky tu
    mov ah, 1
    int 21h
    mov KyTu, al
    
    ; xuat thong bao 5 ky tu dung truoc
    mov ah, 9
    lea dx, Tb2
    int 21h
    
    ;ky tu dung truoc dau tien
    mov dl, KyTu
    sub dl, 5
    mov cx, 5
    
    mov ah, 2
    
    PRINT_BEFORE:
        int 21h
        inc dl
        loop PRINT_BEFORE
        
    ; xuat thong bao 5 ky tu dung sau
    mov ah, 9
    lea dx, Tb3
    int 21h
    
    mov dl, KyTu
    inc dl
    mov cx, 5
    
    mov ah, 2            
    
    PRINT_AFTER:
        int 21h
        inc dl
        loop PRINT_AFTER
    
        
    ; thoat chuong trinh
    mov ah, 4ch
    int 21h
end 