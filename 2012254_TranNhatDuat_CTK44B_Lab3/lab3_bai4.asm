.model small
.stack 100h
.data
    ThongBao db 13, 10, 'Moi ban nhap mot ky tu: $'
    ThongBao2 db 13, 10, '5 ky tu ke tiep la:  $'
    Bien DB ?
    endLine db 10, '$'

.code 
    ; du du lieu tu Data vao Ds
    mov ax, @data   
    mov ds, ax
    
INPUT:   
    ; xuat thong bao nguoi dung nhap vao 1 ky tu
    mov ah, 9
    lea dx, ThongBao
    int 21h
         
    ; nguoi dung nhap vao 1 ky tu
    mov ah, 1
    int 21h         ; AL = input
    
    mov Bien, al
    
    ; xuat ra ket qua nguoi dung nhap
    mov ah, 9
    lea dx, ThongBao2
    int 21h
    
    ; Xuat ra 5 ky tu
    mov cx, 5

PRINT:
    mov ah, 2
    add Bien , 1h       ; cong them 1 de tang ky tu
    mov dl, Bien
    int 21h
    
    mov ah, 9
    lea dx, endLine
    int 21h
    
    loop PRINT
    
    ; thoat chuong trinh
    mov ah, 4ch
    int 21h

end    