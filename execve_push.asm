section .text
global _start

_start:

	; push '/bin/sh\x00'
	push 0x0068732f				; /sh\x00\x00
	push 0x6e69622f				; /bin

        ; 11 execv('/bin/sh\x00', 0, 0)
        mov edx, 0
        mov ecx, 0
        mov ebx, esp			; move '/bin/sh' to ebx register.
        mov eax, 11
        int 0x80
