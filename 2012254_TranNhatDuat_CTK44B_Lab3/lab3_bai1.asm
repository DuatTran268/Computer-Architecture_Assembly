.model small
.stack 100h
.data
    alert db 13, 10, 'Bay gio la (S)ang, (C)hieu, (T)oi:  $'
    morning db 13, 10, 'Chao buoi sang!$'
    afternoon db 13, 10, 'Chao buoi chieu!$'
    evening db 13, 10, 'Chao buoi toi.$'
.code
    mov ax, @data
    mov ds, ax
    
    input:
        ; Xuat thong bao chuong trinh
        mov ah, 9
        lea dx, alert
        int 21h
        ;Nhap vao mot trong cac ky tu S, s, C, c, T, t
        mov ah, 1
        int 21h
        
        ; so sanh kiem tra input nhap vao voi ky tu 'S'
        cmp al, 'S'
        je IsMorning   ;lenh JE chi nhay khi dich = nguon
        ;so sanh input voi ky tu 's'
        cmp al, 's'
        je IsMorning
   
        cmp al, 'C'
        je IsAfternoon
        
        cmp al, 'c'
        je IsAfternoon
        
        cmp al, 'T'
        je IsEvening
        
        cmp al, 't'
        je IsEvening
        
        jmp input     ;n          
        
    IsMorning:
        ; xuat cau thong bao 'Chao buoi sang ';
        lea dx, morning
        jmp Greeting
    IsAfternoon:
        ;xuat cau thong bao 'chao buoi chieu'
        lea dx, afternoon
        jmp Greeting
    IsEvening:
        ;xuat cau thong bao 'chao buoi toi'
        lea dx, evening
        jmp Greeting
    Greeting:
        mov ah, 9
        int 21h             

        mov ah, 4ch   ;thoat chuong trinh
        int 21h
end                              