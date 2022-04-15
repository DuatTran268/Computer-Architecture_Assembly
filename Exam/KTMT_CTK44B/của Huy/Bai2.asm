.MODEL SMALL
.STACK 100h
.DATA
    nhap DB 13,10,"Hay nhap mot chu hoa (A-Z): $" 
    doi DB 13,10,"Chu thuong tuong ung la: $"
    BIEN DB ?
.CODE
   MOV AX, @DATA
   MOV DS, AX    
        
  
INPUT: 
   MOV AH, 9
   LEA DX, nhap          ;xuat thong bao "Hay nhap mot chu hoa (A-Z): $"
   INT 21h
   
   MOV AH, 1             ;nhap mot ky tu
   INT 21h    
   
   CALL THU_TUC          ;goi den thu tuc
   
   MOV AH, 4Ch           ;thoat khoi chuong trinh
   INT 21h
THU_TUC PROC 
   
   CMP AL, 41h           ;so sanh voi ky tu A => quay lai cho ngta nhap khi nao thoa man dieu kien
   JB INPUT              ;nhay khi be hon A
   
   CMP AL, 5Ah           ;so sanh voi ky tu Z
   JA INPUT              ;nhay khi lon hon A  => quay lai cho ngta nhap khi nao thoa man dieu kien
   
   MOV BIEN, AL          ;chuyen input vao bien de luu tru
                          
   ADD BIEN, 20h         ;cong them 20h de ra chu thuong
   
   MOV AH, 9
   LEA DX, doi           ;xuat thong bao "Chu thuong tuong ung la: $"
   INT 21h
   
   MOV AH, 2
   MOV DL, BIEN          ;xuat ra ket qua luu trong dl
   INT 21h
   
   RET                   ;return ve thu tuc
   
THU_TUC ENDP 

END 