org 0x7C00
bits 16


 %define ENDL 0x0D, 0x0A


start:
jmp main

; Prints a string
; Params


puts:

   push si
   push ax


 .loop:
  lodsb
   or al, al,
   jz .done

   mov bh, 0
   mov ah, 0x0e
   int 0x10
     jmp .loop
.done:
 pop ax
 pop si
 ret

main:

   ;setup date segments
   mov ax, 0    ; Can't write to ds/es directly
   mov ds, ax
   mov es, ax

   ; setup stack
   mov ss, ax
   mov sp, 0x7C00


   mov si, msg_welcome
   call puts


   hlt

.halt:


  jmp .halt


  msg_welcome: db 'Welcome to NOS Noahs Operating System', ENDL, 0


times 510-($-$$) db 0
dw 0AA55h 
