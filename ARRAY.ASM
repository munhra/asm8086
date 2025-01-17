.model small
.data
myarray db 'A', 'B', 'C', 'D', 'E'   ; defines the size of the array
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov si, OFFSET myarray    ; si = Source Index, index do array
 mov bl, [si]                ; 
 inc si
 mov bl, [si]
 inc si
 mov bl, [si]
 mov ah, 04ch
 int 21h
main ENDP
END main
