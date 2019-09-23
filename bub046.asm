.model small
.data
a db 02,05,01,04
n db ($-A)
.code
mov ax,@data
mov ds,ax
mov cl,n
dec cl
outerloop:mov ch,cl
mov si,0
innerloop: mov al,a[si]
inc si
cmp al,a[si]
jb noxg
xchg al,a[si]
mov a[si-1],al
noxg:dec ch
jnz innerloop
dec cl
jnz outerloop
mov ah,4ch
int 21h
end
