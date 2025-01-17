.model small
.data
.code
main PROC
  mov ax, 10
  add ax, 16
  mov ah, 04ch
  int 21h
main ENDP
END main
