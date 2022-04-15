.MODEL SMALL
.STACK 100h
.DATA
    TB DB 13, 10, 'Nhap mot ky tu (Hoac ESC):  $'
    TB_Chu DB 13, 10, 'Ky tu da nhap la chu: $'
    TB_So DB 13, 10, 'Ky tu da nhap la so: $'
    TB_Khac DB 13, 10, 'Ky tu da nhap khac chu/ so!$'
    BIEN DB ?
.CODE
    MOV AX, @data
    MOV DS, AX
Lap:
    MOV AH, 9
    LEA DX, TB
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    CMP AL, 1Bh
    JE Exit
    
    CALL Main
    
Exit: 
    MOV AH, 4ch
    INT 21h
    
    main PROC
        CMP AL, '0'
        JB Khac
        
        CMP AL, '9'
        JBE So
        
        CMP AL, 'A'
        JB Khac
        
        CMP AL, 'Z'
        JBE Chu
        
        CMP AL, 'a'
        JB Khac
        
        CMP AL, 'z'
        JBE Chu
        
        JMP Khac
 
So:
    MOV AH, 9
    LEA DX, TB_So
    INT 21h
    JMP Lap
Chu: 
    MOV AH, 9
    LEA DX, TB_Chu
    INT 21h
    JMP Lap
Khac:
    MOV AH, 9
    LEA DX, TB_Khac
    INT 21h
    JMP Lap
    
Trave:
    RET
    
END     