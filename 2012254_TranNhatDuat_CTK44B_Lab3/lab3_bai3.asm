.model small
.stack 100h
.data
    thongbao db 'Cac chu hoa trong bo ma ASCII:  $'

.code
    mov ax, @data
    mov ds, ax  
    
    mov ah, 9
    lea dx, thongbao
    int 21h
    
    mov ah, 2
    mov cx, 26  ; do dai ky tu chu cai can hien thi
    mov dl, 41h ; ky tu bat dau tu "A"

PrintLoop:
    int 21h
    inc dl
    loop PrintLoop
    
    ;lenh thoat chuong trinh
    mov ah, 4ch
    int 21

end    