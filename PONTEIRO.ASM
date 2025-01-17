.model small
.data
var1 db 'R'
var2 db 'A'
ptr1 dw var1
ptr2 dw var2
.code
main PROC
  mov ax, @data
  mov ds, ax
  mov bx, ptr1
  mov bx, ptr2
main ENDP
END main
