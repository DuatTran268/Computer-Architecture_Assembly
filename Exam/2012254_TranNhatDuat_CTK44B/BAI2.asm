.model small
.stack 100h
.data 
    
    tb1 DB 13,10,"Hay nhap mot chu thuong thu 1(a-z): $"
    tb2 DB 13,10,"Hay nhap mot chu thuong thu 2(a-z): $"
    tb3 DB 13,10,"Ket qua: $"
    kytu1 DB ?
    kytu2 DB ?
.code
        MOV AX, @data
        MOV DS, AX

          
  input1:  
        ;xuat cau thong bao 1 
        MOV AH, 9
        LEA DX, tb1            
        INT 21h
        ;nhap vao ky tu thu nhat
        MOV AH, 1 
        INT 21h
        
        ;so sanh input voi ky tu '0'
        CMP AL, 'a'
        JB input1   
        ;so sanh input voi ky tu '9'
        CMP AL, 'z'
        JA input1   
   
        MOV kytu1, AL    
        
        
        
  input2: 
        ;xuat cau thong bao 2
        MOV AH, 9
        LEA DX, tb2            
        INT 21h     
        ;nhap vao ky tu thu hai       
        MOV AH, 1
        INT 21h
        
        ;kiem tra ky tu 1
        CMP AL, 61h
        JB input2
        
        CMP AL, 7Ah
        JA input2
          
        MOV kytu2, AL      ;chuyen al vao kyTu2 luu tru
         

        MOV AH, 9
        LEA DX, tb3            
        INT 21h 
        
        
        MOV AH,2
        MOV DL, kytu1
        INT 21h 
        MOV AH,2
        MOV DL, kytu2
        INT 21h
        
                         

        MOV AH, 4ch   ;thoat chuong trinh
        INT 21h
END 