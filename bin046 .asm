.model small
display1 macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
list db 1h,2h,3h,5h,7h,8h
number equ ($-list)
key db 4h
msg1 db 0dh,0ah,"Element found in the list...$"
msg2 db 0dh,0ah,"Search failed !! element not found in the list $"

.code
start: mov ax,@data
mov ds,ax
mov ch,number-1
mov cl,00h

again: mov si,offset list
xor ax,ax
cmp cl,ch
je next
jnc failed

next: mov al,cl
add al,ch
shr al,01h
mov bl,al
xor ah,ah
mov bp,ax
mov al,ds:[bp][si]
cmp al,key
je success
jc inclow
mov ch,bl
dec ch
jmp again

inclow: mov cl,bl
inc cl
jmp again

success: mov al,key
add al,30h
mov dl,al
mov ah,02h
int 21h
display1 msg1
jmp final

failed :mov al,key
add al,30h
mov dl,al
mov ah,02h
int 21h

display1 msg2
final : mov ah,01h
int 21h

mov ah,4ch
int 21h

end start
