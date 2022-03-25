.MODEL SMALL
.STACK
.DATA
    string DB 'Hello world!$'
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, string
    
    MOV AH, 09H
    INT 21H
    
    MOV AH, 4CH
    INT 21h
END 