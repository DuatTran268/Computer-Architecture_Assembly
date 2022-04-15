.model small
.stack 100h      ; vung chua du lieu 100h co nghia la ma hexa

.data
    ; vung khai bao bien

.code
    ; vung de code chuong trinh giong ham main c++
    ; thu tuc procedure tuong duong voi function    
    main proc
    
    
    ; nhap vao ky tu tu ban phim 
    mov ah, 1   ; gan ah = 1
    int 21h     ; lenh ngat
    
    
    
    ; lenh xuat ra man hinh
    mov ah, 2
    mov dl, al
    int 21h                 
                              
                              
                              
    ; dung chuong trinh de xem ket qua    
    mov ah, 4ch 
    int 21h   ; interrupt lenh ngat  
    
    
    
    
    
    main endp ; ket thuc chuong trinh
END