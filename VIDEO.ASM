.model small
.stack 100h
.data
 vmode db 0
 columns db 0
 pg db 0
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov ah, 0fh       ; get video mode function 0fh
 int 10h           ; video interruption 10h
 mov vmode, al
 mov columns, ah
 mov pg, bl
 mov ah, 0         ; set video mode function 00h
 mov al, 3         ; change video mode to 3
 int 10h           ; video interruption 10h
 mov ah, 01h       ; set cursor lines function 01h
 mov cx, 0407h     ; cursor lines from lines 04 to 07
 int 10h
 mov ah, 2         ; set cursor position function 02h
 mov dh, 20        ; set line number to 20
 mov dl, 20        ; set column number to 60
 mov bh, 0         ; set page to 0
 int 10h
 mov ah, 9
 mov al, 0b2h
 mov bh, 0
 mov bl, 71h
 mov cx, 100
 int 10h
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main
