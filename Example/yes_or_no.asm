.MODEL SMALL
.DATA
Prompt DB ' Is it after 12 noon (Y/N)?$'
Msg1 DB 13, 10, 'Good morning, world!$'
Msg2 DB 13, 10, 'Good afternoon, world!$'
.CODE
    MOV AX, @DATA
    MOV DS, AX
    
    LEA DX, Prompt
    MOV AH, 9
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    CMP AL, 'y'
    JE IsAfternoon
    CMP AL, 'Y'
    JE IsAfternoon
IsMorning:
    LEA DX, Msg1
    JMP Greeting
IsAfternoon:
    LEA DX, Msg2
Greeting:
    MOV AH, 9
    INT 21h
MOV AH, 4Ch
INT 21h