.model small
.stack 100h
.data
    TB DB 10, 13, 'Nhap vao 1 ky tu:  $'
    TB1 DB 10, 13, 'Ky tu da nhap la chu!  $'
    TB2 DB 10, 13, 'Ky tu da nhap la so!  $'
    TB3 DB 10, 13, 'Ky tu da nhap khac chu/so!  $'
    END1 DB 10, 13, 'Bam 1 phim bat ki de that chuong trinh!$'

.code
    ;lay du lieu tu Data va Ds
    MOV AX, @data
    MOV DS, AX
    
INPUT:
    ;thong bao nhap 1 ky tu
    MOV AH, 9
    LEA DX, TB
    INT 21h
    
    ;nhap 1 ky tu
    MOV AH, 1
    INT 21h
    
    CMP AL, 1Bh     ; phim ESC de thoat vong lap
    JE BREAK
    
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
    
    KHAC: 
        MOV AH, 9    
        LEA DX, TB3
        INT 21h
        
        JMP CONTINUE
        
    CHU:
        MOV AH, 9
        LEA DX, TB1
        INT 21h
        
        JMP CONTINUE
    SO:
        MOV AH, 9
        LEA DX, TB2
        INT 21h
        
    CONTINUE:
        JMP INPUT
        
BREAK:
    ; thoat chuong trinh
    CALL THOAT
    
    ; khai bao thu tuc
    THOAT PROC
         MOV AH, 9
         LEA DX, END1
         INT 21h
         
         MOV AH, 7
         INT 21h
         
         MOV AH, 4ch
         INT 21h
         RET
    THOAT ENDP
    
END
    
          
    
        
    