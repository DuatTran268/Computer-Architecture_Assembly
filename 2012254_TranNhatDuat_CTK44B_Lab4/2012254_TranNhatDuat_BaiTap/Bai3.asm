.MODEL SMALL
.STACK
.DATA

    TB1 DB 13, 10, 'Hay nhap mot chu thuong ( a -> z ):  $'
    TB2 DB 13, 10, 'Chu hoa tuong ung la:  $'
    KYTU DB ?
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    
LAP:
    MOV AH, 9
    LEA DX, TB1
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    CALL MAIN
        
        MOV AH, 4CH
        INT 21H
        
        MAIN PROC
            CMP AL, 'a'
            JB LAP
            
            CMP AL, 'z'
            JA LAP
            
            SUB AL, 32
            MOV KYTU, AL
            
            MOV AH, 9
            LEA DX, TB2
            INT 21H
            
            MOV AH, 2
            MOV DL, KYTU
            INT 21H
            
            RET
            
        MAIN ENDP


END