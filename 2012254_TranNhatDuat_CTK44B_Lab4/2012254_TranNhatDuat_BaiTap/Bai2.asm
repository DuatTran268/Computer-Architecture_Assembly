.MODEL SMALL
.STACK 100h
.DATA     
    TBAO DB 13, 10, 'Nhap mot ky tu (Hoac ESC):  $'
    TBAO_CHU DB 13, 10, 'Ky tu da nhap la chu!  $'
    TBAO_SO DB 13, 10, 'Ky tu nhap la so !$'
    TBAO_KHAC DB 13, 10, 'Ky tu nhap khac chu/so!$'
    BIEN DB ?
.CODE
    MOV AX, @DATA
    MOV DS, AX
LAP:
    MOV AH, 9
    LEA DX, TBAO
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    CMP AL, 1Bh
    JE EXIT
    
    CALL MAIN
    
EXIT:
    MOV AH, 4Ch
    INT 21h
    
    MAIN PROC
        CMP AL, '0'
        JB KHAC
        
        CMP AL, '9'
        JBE SO
        
        CMP AL, 'A'
        JB KHAC
        
        CMP AL, 'Z'
        JBE CHU
        
        CMP AL, 'a'
        JB KHAC
        
        CMP AL, 'z'
        JBE CHU
        
        JMP KHAC
        
SO: 
    MOV AH, 9
    LEA DX, TBAO_SO
    INT 21h
    JMP LAP
    
CHU:
    MOV AH, 9
    LEA DX, TBAO_CHU
    INT 21h
    JMP LAP
KHAC:
    MOV AH, 9
    LEA DX, TBAO_KHAC
    INT 21h
    JMP LAP
    
TRAVE:
    RET
    
END          