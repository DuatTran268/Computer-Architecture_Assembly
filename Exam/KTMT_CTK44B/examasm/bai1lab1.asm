.model 
.stack 100h
.data
    text db "hello world!$"     
    text2 db 13, 10, "hello, solar system !$"
    text3 db 13, 10, "hello university !$"
    
.code
    main proc 
    mov ax, @data
    mov ds, ax
    
    ; xuat chuoi ra man hinh
    mov ah, 9
    lea dx, text
    int 21h  
    
    lea dx, text2
    int 21h   
    
    lea dx, text3
    int 21h
    
    
    
    ; dung chuong trinh pause
    mov ah, 4ch
    int 21h
    
    main endp
    
end          