section .text
global _start

_start:

	; push '/bin/sh\x00'
	push 0x0068732f				; /sh\x00\x00
	push 0x6e69622f				; /bin

        ; 11 execve('/bin/sh\x00', 0, 0)
        mov edx, 0                ; size to read
        mov ecx, 0               	; file contents
        mov ebx, esp                  ; print to stdout
        mov eax, 11
        int 0x80
