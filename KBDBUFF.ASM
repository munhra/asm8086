.model small
.stack 100h
.data
 scanCode db 0
 ASCIICode db 0
.code
main PROC
 mov ax, @data
 mov ds, ax
L2:
 mov ah, 11h
 int 16h
 mov scanCode, ah
 mov ASCIICode, al
 mov ah, 10h
 int 16h
 cmp al, 1bh
jne L2
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main
