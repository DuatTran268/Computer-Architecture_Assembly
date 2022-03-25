.model small
.stack 100h
.data
    TB db 13, 10, 'Nhap vao mot ky tu:  $'
    TBKhac db 13, 10,'Ky tu nhap khac chu/ so $'
    TBSo db 13, 10, 'Ky tu nhap la so$ '       
    TBChu db 13, 10, 'Ky tu da nhap la so$'

.code
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, TB  ; thong bao
    int 21h
    
    ; lenh nhap 1 ky tu
    mov ah, 1
    int 21h
                
    cmp al, '0'
    jb Khac
    
    cmp al, '9'
    jbe So
    
    cmp al, 'A'
    jb Khac
    
    cmp al, 'Z'
    jb Khac
    
    cmp al , 'a'
    jbe Chu
    
    cmp al, 'z'
    jbe Chu
    
Khac: 
    lea dx, TBKhac
    jmp KetThuc
    
So: 
    lea dx, TBSo
    jmp KetThuc
Chu: 
    lea dx, TBChu
    jmp KetThuc
KetThuc:
    mov ah, 9
    int 21h
    
    
    mov ah, 4ch
    int 21h
end
   