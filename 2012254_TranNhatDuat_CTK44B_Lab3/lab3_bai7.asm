.model small
.stack 100h
.data
    TB1 db 10, 13, 'Nhap vao 1 ky tu:  $'
    RES1 db 10, 13, 'Ky tu da nhap la chu!  $'
    RES2 db 10, 13, 'Ky tu da nhap la so!  $'
    RES3 db 10, 13, 'Ky tu da nhap khac chu/so!  $'
    END1 db 10, 13, 'Bam 1 phim bat ki de that chuong trinh!$'

.code
    ;lay du lieu tu Data va Ds
    mov ax, @data
    mov ds, ax
    
INPUT:
    ;thong bao nhap 1 ky tu
    mov ah, 9
    lea dx, TB1
    int 21h
    
    ;nhap 1 ky tu
    mov ah, 1
    int 21h
    
    cmp al, 1Bh     ; phim ESC de thoat vong lap
    je BREAK
    
    cmp al, '0'
    jb KHAC
    cmp al, '9'
    jbe SO
    cmp al, 'A'
    jb KHAC 
    cmp al, 'Z'
    jbe CHU
    cmp al, 'a'
    jb KHAC
    cmp al, 'z'
    jbe CHU
    
    KHAC: 
        mov ah, 9    
        lea dx, RES3
        int 21h
        
        jmp CONTINUE
        
    CHU:
        mov ah, 9
        lea dx, RES1
        int 21h
        
        jmp CONTINUE
    SO:
        mov ah, 9
        lea dx, RES2
        int 21h
        
    CONTINUE:
        jmp INPUT
        
BREAK:
    ; thoat chuong trinh
    call THOAT
    
    ; khai bao thu tuc
    THOAT proc
         mov ah, 9
         lea dx, END1
         int 21h
         
         mov ah, 7
         int 21h
         
         mov ah, 4ch
         int 21h
         ret
    THOAT endp
    
end
    
          
    
        
    