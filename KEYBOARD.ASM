.model small
.stack 100h
.data
 scanCode db 0ffh
 ASCIICode db 0ffh
 cursorColumn db 0
 cursorRow db 0
 charAttr db 00h
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov ah, 2
 mov dh, 0
 mov dl, 0
 mov bh, 0
 int 10h
 L1:
  mov bl, charAttr
  inc bl
  mov charAttr, bl
  mov ah, 10h          ; Loads 10h (16) in ah function to wait keyboard stroke
  int 16h              ; calls int 16h (22) for keyboard functions
  mov scanCode, ah     ; loads scanCode in ah
  mov ASCIICode, al    ; loads ascii code in al
  mov ah, 9            ; loads 9 value in ah for video to print caracter
  mov bh, 0            ; load page number 0 in bh
  mov bl, charAttr     ; load 71h for char attributes in bl, bg color, fg color
  mov cx, 1            ; loads 1 in cx to repeat one time the caracter
  int 10h              ; call int 10h (16) for video interruption functions
  mov bl, cursorColumn
  inc bl
  mov cursorColumn, bl
  mov ah, 2
  mov dh, 0
  mov dl, cursorColumn
  mov bh, 0
  int 10h
  cmp al, 1Bh          ; end the program if ESC key is pressed
 jne L1
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main
