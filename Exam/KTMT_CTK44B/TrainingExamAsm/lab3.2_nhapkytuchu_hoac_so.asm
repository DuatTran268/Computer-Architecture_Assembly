.MODEL SMALL
.STACK 100h
.DATA
    tb DB 13, 10, 'Nhap vao mot ky tu:  $'
    tbKhac DB 13, 10, 'Ky tu nhap khac chu/so $'
    tbSo DB 13, 10, 'Ky tu nhap vao la so $'
    tbChu DB 13,, 10, 'Ky tu da nhap la chu$'
.code
    MOV AX, @data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, tb      ; thong bao
    INT 21h
    
    ; lenh nhap 1 ky tu
    MOV AH, 1
    INT 21h
    
    CMP AL, '0'
    JB Khac
    
    CMP AL, '9'
    JBE So
    
    CMP AL, 'A'
    JB Khac
    
    CMP AL, 'Z'
    JB Khac
    
    CMP AL, 'a'
    JBE Chu
    
    CMP AL, 'z'
    JBE Chu
    
Khac:
    LEA DX, tbKhac
    JMP KetThuc
    
So: 
    LEA DX, tbSo
    JMP KetThuc
Chu:
    LEA DX, tbChu
    JMP KetThuc
KetThuc:
    MOV AH, 9
    INT 21h
    
    MOV AH, 4ch
    INT 21h
    
END
 