.model small
.data
numbers dw 10, 11, 3, 8, 0ffh
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov si, OFFSET numbers
 mov ax, 0
 mov cx, 5
L1:
  mov bx, [si]
  add ax, bx
  inc si
  inc si
loop L1
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main
