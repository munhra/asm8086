.model small
.stack 100h
.data
myname db "Rafael Munhoz"
inverted db 13 dup(?)
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov si, OFFSET myname
 mov cx, 13
L1:
 mov bl, [si]
 push bx
 inc si
loop L1
 mov cx, 13
 mov si, OFFSET inverted
L2:
 pop bx
 mov [si], bl
 inc si
loop L2
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main

