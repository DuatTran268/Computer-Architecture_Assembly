.MODEL SMALL
.STACK 100h
.DATA
    tb DB 'Cac chu hoa trong bo ma ASCII:  $'
.CODE
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, tb
    INT 21h
    
    MOV AH, 2
    MOV CX, 26      ; do dai ky tu chu cai can hien thi
    MOV DL, 41h     ; ky tu bat dau tu 'a'
    
PrintLoop:
    INT 21h
    INC DL
    LOOP PrintLoop
    
    ; lenh thoat chuong trinh
    MOV AH, 4ch
    INT 21h
    
END