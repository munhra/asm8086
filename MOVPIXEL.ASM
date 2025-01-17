.model small
.stack 100h
.data
 defaultVideoMode db 0
 color db 0010b
 ;scanCode db 0
 ;ASCIICode db 0
.code
main PROC
 mov ax, @data
 mov ds, ax
 mov ah, 0fh
 int 10h                    ; reads the default video mode to restore it
 mov defaultVideoMode, al   ; store default video mode in memory
 mov ah, 0                  ; put 0 into AH for function to set graphics mode
 mov al, 13h                ; load AL with 13h 320x200 256 colors
 int 10h                    ; call int 10h to change video mode
 mov cx, 160
 mov dx, 100
 L1:
  mov ah, 0Ch               ; load 0C into AH to draw a pixel using int 10h
  mov al, color             ; loads the pixel color
  mov bh, 0                 ; loads the video page, 0 by default
  ;inc cx                   ; x coordinate of the pixel
  ;inc dx                   ; y coordinate of the pixel
  int 10h                   ; call int 10h to draw the pixel
  mov bl, color
  inc bl
  mov color, bl
  mov ah, 11h               ; move function 11h to read keyboard buffer
  int 16h                   ; call int 16h for keyboard interruption
  jz L1
  ;mov scanCode, ah
  ;mov ASCIICode, al
  mov ah, 10h
  int 16h
  cmp ah, 4dh               ;
  jne KEYLEFT
  inc cx
KEYLEFT:
  cmp ah, 4bh
  jne KEYUP
  dec cx
KEYUP:
  cmp ah, 48h
  jne KEYDOWN
  dec dx
KEYDOWN:
  cmp ah, 50h
  jne KEYESC
  inc dx
KEYESC:
  cmp al, 1bh
  jne L1
 mov ah, 0                  ; loads 0 in AH to set video mode
 mov al, defaultVideoMode   ; restore default video mode
 int 10h                    ; execute interruption to restore video mode
 mov ax, 0
 mov ah, 04ch
 int 21h
main ENDP
END main
