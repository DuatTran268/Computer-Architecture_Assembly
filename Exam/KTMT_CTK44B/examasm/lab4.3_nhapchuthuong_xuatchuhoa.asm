.MODEL SMALL
.STACK 100h
.DATA
    TB1 DB 13, 10, 'Hay nhap mot chu thuong (a -> z):  $'
    TB2 DB 13, 10, 'Chu hoa tuong ung la: $'
    KyTu DB ?
    
.CODE
    MOV AX, @data
    MOV DS, AX
    
Lap:
    MOV AH, 9
    LEA DX, TB1
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    CALL MAIN
        MOV AH, 4ch
        INT 21h
        
        MAIN PROC
            CMP AL, 'a'
            JB LAP
            
            CMP AL, 'z'
            JA LAP
            
            SUB AL, 32
            MOV KyTu, AL
            
            MOV AH, 9
            LEA DX, TB2
            INT 21h
            
            MOV AH, 2
            MOV DL, KyTu
            INT 21h
            
            RET
            
        MAIN ENDP
END