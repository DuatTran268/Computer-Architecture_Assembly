.model small
.stack
.data    
CR EQU 13
LF EQU 10
message1 db 'Enter a binary nummber: $'
message2 db 'Your input number:  $'
.code
    mov ax,@data
    mov ds, ax
    xor bx, bx
    mov ah, 9
    lea dx, message1
    int 21h
    mov ah,1
N2:
    int 21h
    cmp al, CR
    je N8      
    ; chuyen ki tu thanh so ('0' = 30h, '1' = 31h)
    and al, 0Fh
    shl bx, 1
    or bl, al
    jmp N2
N8:
    mov cx, 16
    mov ah, 9
    lea dx, message2
    int 21h
    PrintLoop:
        rol bx, 1
        jc Print1
        mov dl, '0'
        mov ah, 2
        int 21h
        jmp Exit1
    Print1:
        mov dl, '1'
        mov ah, 2
        int 21h
        
    Exit1:
        dec cx
        cmp cx, 0
        jne PrintLoop
        
    mov ah, 4ch
    int 21h
    
END    