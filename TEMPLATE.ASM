.model small
.stack 100h
.data
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov ax, 0
 mov ah, 04ch
int 21h
main ENDP
END main
