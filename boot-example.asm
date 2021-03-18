[bits 16]
[org 0x7c00]    ;BIOS loads this code at 0x7c00
mov ax, 0
mov ds, ax  ;Initialize data segment register
mov ah, 0x0e    ;For Using BIOS to print a character

jmp args

args:
mov si, message
jmp print

print:
mov al, [si] ;move value of si in to lower ax (al)
or al, al ;check if al is zero
jz halt

inc si
int 0x10  ;printerupt
jmp print

message db "hello", 13,10,0

halt:
times 510 - ($-$$) db 0     ;Put 0s till 510
dw 0xaa55
