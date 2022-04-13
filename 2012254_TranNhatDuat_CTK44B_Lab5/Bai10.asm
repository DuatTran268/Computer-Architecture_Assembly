.MODEL SMALL
.STACK 100H
.DATA
    
    TB1 DB 10, 13, 'Nhap vao chieu dai:  $'
    TB2 DB 10, 13, 'Nhap vao chieu rong:  $'
    TB3 DB 10, 13, 'Dien tich =  $'
    TB4 DB 10, 13, 'Chu vi =  $'
    
    CHIEU_DAI DW ?
    CHIEU_RONG DW ?
    
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    ; NHAP VAO CHIEU DAI
    NHAP_DAI:
        LEA DX, TB1
        CALL XUAT_CHUOI
        
        CALL NHAP_THAP_PHAN
        CMP DX, 0
        JE NHAP_DAI
        
     MOV CHIEU_DAI, BX
     
     ; NHAP CHIEU RONG
     NHAP_RONG:
        LEA DX, TB2
        CALL XUAT_CHUOI
        
        CALL NHAP_THAP_PHAN
        CMP DX, 0
        JE NHAP_RONG
        
     MOV CHIEU_RONG, BX
     
     ; GAN GIA TRI VAO BX, CX
     MOV BX, CHIEU_DAI
     MOV CX, CHIEU_RONG
     
     ; XUAT DIEN TICH
     LEA DX, TB3
     CALL XUAT_CHUOI  
     
     CALL TINH_DIEN_TICH
     CALL XUAT_THAP_PHAN
     
     ; XUAT CHU VI
     LEA DX, TB4
     CALL XUAT_CHUOI
     
     CALL TINH_CHU_VI
     CALL XUAT_THAP_PHAN
     
     MOV AH, 4CH
     INT 21H
     
     ; KHAII BAO THU TUC
     XUAT_CHUOI PROC
        MOV AH, 9
        INT 21H
        RET
     XUAT_CHUOI ENDP
     
     NHAP_THAP_PHAN PROC
        PUSH AX
        PUSH CX
        PUSH SI
        
        XOR BX, BX
        
     INPUT:
     
     MOV AH, 1
     INT 21H
     
     CMP AL, 0DH
     JE BREAK
     
     CMP AL, '0'
     JB XULY_LOI
     CMP AL, '9'
     JA XULY_LOI
     
     AND AL, 0FH
     MOV CL, AL
     XOR CH, CH
     
     MOV AX, BX
     MOV SI, 10
     MUL SI
     MOV BX, AX
     ADD BX, CX
     
     JMP INPUT
     
     XULY_LOI:
        XOR BX, BX
        MOV DX, 0
        JMP EXIT
        
     BREAK:
        MOV DX, 1
     EXIT: 
        POP SI
        POP CX
        POP AX
        
     RET
NHAP_THAP_PHAN ENDP
XUAT_THAP_PHAN PROC
    
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    
    MOV BX, 10
    XOR CX, CX
    
    XULY_STACK:
        XOR DX, DX
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX, 0
        JA XULY_STACK
        
    PRINT:
        POP DX
        OR DX, 30H
        MOV AH, 2
        INT 21H
        
    LOOP PRINT
    
    POP DX
    POP CX
    POP BX
    POP AX
    RET
    
XUAT_THAP_PHAN ENDP

    TINH_DIEN_TICH PROC
        MOV AX, BX
        MUL CX
        RET
    TINH_DIEN_TICH ENDP
    
    TINH_CHU_VI PROC
        PUSH BX
        ADD BX, CX
        MOV AX, 2
        MUL BX 
        
        POP BX
        RET 
    TINH_CHU_VI ENDP
    
END  