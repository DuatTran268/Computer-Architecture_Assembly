.model small
.stack 100
.data
    str DB "Hi, world 123$"
.code
    main PROC
        ;get data
        MOV AX, @data
        MOV DS, AX

        ;tro den str
        LEA SI, str

        MOV CX, 13 ;khoi tao so lan lap
        push_loop:
            PUSH [SI] ;day phan tu thu SI vao stack
            INC SI
            LOOP push_loop

        ;Luu y: khi chay xong 1 vong lap thi CX = 0

        MOV CX, 13 ;khoi tao lai so lan lap
        pop_loop:
            POP DX ;lay phan tu cuoi stack va luu vao DL

            ;in ky tu vua POP ra duoc
            MOV AH, 2
            INT 21h

            LOOP pop_loop

        ;dung chuong trinh
        MOV AH, 4ch
        INT 21h
    main ENDP
END