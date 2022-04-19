.MODEL SMALL
.STACK 100h
.DATA
    TB DB 13, 10, 'Nhap mot ky tu (Hoac ESC):  $'
    TB_Chu DB 13, 10, 'Ky tu da nhap la chu ! $'
    TB_So DB 13, 10, 'Ky tu da nhap la so !$'
    TB_Khac DB 13, 10, 'Ky tu nhap khac chu/ so !$'
    BIEN DB ?
.CODE
    MOV AX, @data
    MOV DS, AX
LAP:
    MOV AH, 9
    LEA DX, TB
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    CMP AL, 1Bh
    JE THOAT
    
    CALL MAIN
THOAT:
    MOV AH, 4ch
    INT 21h
    
    MAIN PROC
        CMP AL , '0'
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
    LEA DX, TB_So
    INT 21h
    JMP LAP
CHU:
    MOV AH, 9
    LEA DX, TB_Chu
    INT 21h
    JMP LAP
KHAC:
    MOV AH, 9
    LEA DX, TB_Khac
    INT 21h
    JMP LAP
    
    
TRAVE:
    RET
     
END            