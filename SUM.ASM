.386
.model flat,stdcall
.data
soma dw 0
myvar dd 10
myvar2 df 11
myvar3 db 2
myvar4 dq 13
myvar5 dt 20
myvar6 db -20
myvar7 db 'A'
myvar8 dd ?
mylist dd 10,12,13
rval1 dd 1.30
myvar9 db "Hello World Variable",0 
myarray db 10 dup(2)
student STRUC
id dw ?
sname db "Student Name"
scores db 10 DUP(100)
student ENDS
count = 1000 ; constant using = operator


.code
main PROC
        mov ax, 5
        add ax, 6
        mov soma, ax
        mov ah, 04ch
        int 21h
main ENDP
END main

