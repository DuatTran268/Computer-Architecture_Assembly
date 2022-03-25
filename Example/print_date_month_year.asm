;program print date, month, year
include 'emu8086.inc'
.model small
.data
    mday db 13,10, 'Day: ', 0
    mmonth db 13,10, 'Mon: ', 0
    myear db 13, 10, 'Year: ', 0
.code
    mov ax, @data
    mov ds, ax
    
    mov ah, 2ah
    int 21h
    mov bh, dh
    mov bl, dl
    
    ;Day
    lea si, mday
    call print_string
    mov al, bl
    xor ah, ah
    call print_num
    
    ;Month
    lea si, mmonth
    call print_string
    mov al, bh
    xor ah, ah
    call print_num
    
    ;Year
    lea si, myear
    call print_string
    mov ax, cx
    call print_num
           
    ; thoat chuong trinh       
    mov ah, 4ch
    int 21h
  ret
    
    DEFINE_SCAN_NUM
    DEFINE_PRINT_STRING
    DEFINE_PRINT_NUM
    DEFINE_PRINT_NUM_UNS
    
end