.model small
.data
var1 db 'R'
var2 db 'A'
.code
main PROC
  mov ax, @data
  mov ds, ax
  mov bl, var1
  mov bh, var2
  mov ah, 04ch
  int 21h
main ENDP
END main
