.model small
.stack 100h
.data
sumResult dw 0
.code

sumThree PROC
 add ax, bx
 add ax, cx
 ret
sumThree ENDP

main PROC
 mov ax, @data
 mov ds, ax
 mov ax, 10
 mov bx, 30
 mov cx, 5
 call sumThree
 mov sumResult, ax
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main

