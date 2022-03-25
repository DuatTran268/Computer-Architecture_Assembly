.model small
.stack 
.data
    thongbao1 db 13,10,'Nhap mot ky tu:  $'
    thongbao2 db 13,10,'Dung truoc:  $'
    thongbao3 db 13,10,'Dung sau:  $'
    thongbao4 db 13,10,'Da nhap: $'
    kyTu db ?
.code
    mov ax, @data
    mov ds, ax
    
    ; xuat thong bao 1
    mov ah, 9
    lea dx, thongbao1
    int 21h

    mov kyTu, al  
    
    ; xuat thong bao 2
    mov ah, 1
    int 21h 
    
    mov ah, 9
    lea dx, thongbao2
    int 21h  
    
    ; xuat ky tu truoc 
    mov ah, 2
    lea dx, kyTu
    dec dl
    int 21h
    
    ; xuat thong bao 4
    mov ah,9
    lea dx, thongbao4
    int 21h
    
    ; xuat ky tu da nhap
    mov ah,2
    mov dl, al
    mov dl, kyTu
    int 21
    
    mov ah,4ch
    int 21h
end
    
    
   
    