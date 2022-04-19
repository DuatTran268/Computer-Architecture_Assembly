.MODEL
.STACK
.DATA       
    TBAO1 DB 13,10,"NHAP SO THAP PHAN: $"
    TBAO2 DB 13,10,"SO THAP PHAN VUA NHAP: $"
.CODE       
    MOV AX, @DATA
    MOV DS, AX
                                  
    CALL INPUT          ; goi thu tuc input de nhap            
    CALL OUTPUT         ; goi den thu tuc output => sau khi nhap xong thi se nhay xuat ra output
         
    MOV AH, 4CH         ; dung chuong trinh
    INT 21H
     
INPUT PROC         
  START:
   XOR CX,CX             ;xoa cx ve 0 
   
   LEA DX,TBAO1          ;xuat thong bao 1
   MOV AH,9
   INT 21H
   
   MOV AH, 1             ;nhap mot ky tu
   INT 21H
   
   CMP AL, '-'           ;so sanh voi dau tru => so am
   JE DAUTRU             ;nhay toi label DAUTRU
   
   CMP AL, '+'           ;so sanh voi dau tru => so duong
   JE DAUCONG            ;nhay toi label DAUCONG
   
   JMP TIEPTUC           ;Nhay Xuong TIEPTUC (nhay khong dieu kien)
             
  DAUTRU:                
   MOV CX, 1             ;gan CX = 1 (diem bat dau)
             
  DAUCONG:
   INT 21H
             
  TIEPTUC:
                
   CMP AL, '0'           ;so sanh voi ky tu 0
   JNGE KHONGPHAISO      ; nhay  neu khong lon hon hoac bang 0 => ( not >= 0)
   
   CMP AL, '9'           ;so sanh voi ky tu 9
   JNLE KHONGPHAISO      ; nhay neu khong be hon hoac bang = 9 => ( not <= 9)
   
   AND AX, 000FH   
   PUSH AX               ; dua ax vao trong ngan xep (stack)
                   
   MOV AX, 10
   MUL BX                ;lay ax nhan 10 (he 10)
   MOV BX, AX            ;chuyen ax  vao bx
   POP AX                ;lay ax ra tu ngan xep
   ADD BX, AX            ;cong lai
  
   MOV AH, 1             ;nhap mot ky tu
   INT 21H 
  
   CMP AL, 13            ;so sanh voi phim Enter
   JNE TIEPTUC           ;nhay neu khong bang Enter
                 
   MOV AX, BX            ;chuyen bx vao ax lai
        
   OR CX, CX             ; KIEM TRA xem CX co bang 0 hay khong? vi no lam thay doi co ZF ( Neu ZF=0 thi CX=0 )
   JE TRAVE              ; nhay xuong TRAVE
   NEG AX                ;lay bu 2
                 
   TRAVE:                
   RET
   KHONGPHAISO:
   JMP START               
INPUT ENDP 
     
OUTPUT PROC
   PUSH AX              ;dua ax vao stack    
   
   LEA DX,TBAO2         ;thong bao xuat
   MOV AH,9
   INT 21H  
   
   POP AX               ;lay ax ra
                        
                        
   CMP AX, 0            ;so sanh voi so 0
   JGE DOIRATHAPPHAN    ;nhay neu lon hon hoac bang 0 ( >=0 )
        
   PUSH AX              ;dua vao tiep
   MOV DL, '-'          ;chuyen ky tu dau tru vao de xuat ra man hinh
   MOV AH, 2
   INT 21H
   
   POP AX               ;lay ra
   NEG AX               ;lay bu 2
  DOIRATHAPPHAN:
   XOR CX, CX           ;xoa cx = 0
   MOV BX, 10 
   CHIA:
   XOR DX, DX           ;xoa dx =0
   DIV BX               ;chia cho 10
              
   PUSH DX              ;dua vao dx
   INC CX               ;tang cx len
                
   CMP AX, 0            ;so sanh ax voi 0
   JNE CHIA             ;nhay den label CHIA neu KHONG BANG 0
   MOV AH, 2            ;goi ham 2 de xuat ra man hinh
  DOI:
               
   POP DX               ;lay ra
   OR DL, 30H           ;chuyen ve so
   INT 21H
   LOOP DOI             ;lap lai DOI
  RET                   ;return
OUTPUT ENDP
END  
;===================== Copyright 2021 Doan Quang Huy. All rights reserved ========================