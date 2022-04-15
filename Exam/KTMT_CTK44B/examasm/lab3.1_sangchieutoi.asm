.MODEL SMALL
.STACK 100h
.DATA
    alert DB 13, 10, 'Bay gio la buoi (S)ang, (C)hieu, (T)oi:  $'
    morning DB 13, 10, 'Chao buoi sang!$'
    afternoon DB 13, 10, 'Chao buoi chieu !$'
    evening DB 13, 10, 'Chao buoi toi.$'    
    
.CODE
    MOV AX, @data
    MOV DS, AX
    
    input:
        ; xuat thong bao chuong trinh
        MOV AH, 9
        LEA DX, alert
        INT 21h
        
        ; nhap vao mot trong cac ky tu S, s, C, c, T, t
        MOV AH, 1
        INT 21h
        
        ; so sanh kiem tra value input nhap vao voi ky tu 'S'
        CMP AL, 'S'
        JE IsMorning    ; lenh JE chi nhay khi dich = nguon 
        ; so sanh input voi ky tu 's'
        CMP AL, 's'
        JE IsMorning
        
        CMP AL, 'C'
        JE IsAfternoon
        CMP AL, 'c'
        JE IsAfternoon
        CMP AL, 'T'
        JE IsEvening
        CMP AL, 't'
        JE IsEvening
        
        JMP input
     IsMorning:
        ; xuat cau thong bao ' Chao buoi sang '
        LEA DX, morning
        JMP Greeting
     IsAfternoon:
        ; xuat cau thong bao ' Chao buoi chieu '
        LEA DX, afternoon
        JMP Greeting
     IsEvening:
        ; xuat cau thong bao chao buoi toi
        LEA DX, evening
        JMP Greeting
     Greeting:
        MOV AH, 9
        INT 21h
        
        ; thoat chuong trinh
        MOV AH, 4ch     
        INT 21h
        
END           