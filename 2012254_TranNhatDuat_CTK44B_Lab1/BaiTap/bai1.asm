.MODEL SMALL
.STACK
.DATA
    string DB 'Hello, world!$'
    string2 DB 13, 10, 'Hello, solar system!$'
    string3 DB 13, 10, 'Hello, universe!$'
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ; thong bao 1
    MOV AH, 09h
    MOV dx, offset string
    INT 21h
    
    ; thong bao 2
    MOV ah, 09h
    MOV dx, offset string2
    int 21h
    
    ; thong bao 3
    MOV AH, 09h
    MOV DX, offset string3
    int 21h
    
    ; thoat chuong trinh
    MOV AH, 4CH
    int 21
END