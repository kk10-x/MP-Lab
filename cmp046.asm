.model small
display macro msg
lea dx,msg
mov ah,09h
int 21h
endm

.data
  len db 0
  str1 db 10h dup(0)
  str2 db 10h dup(0)
  msg1 db 0dh,0ah,"Enter the first string$"
  msg2 db 0dh,0ah,"enter the second string$"
  strequ db 0dh,0ah,"Strings are Equal$"
  strnequ db 0dh,0ah,"Strings are Unequal$"


.code
     mov ax,@data
    mov ds, ax
    mov es,ax
    mov si,00h
    mov di,00h
    display msg1
lp1:mov ax,01h
    int 21h

    cmp al,0dh
    jz msg
    mov str1[si],al
    inc si
    inc len
    jmp lp1

msg:display msg2
   jmp lp2
lp2:mov ax,01h
    int 21h
    cmp al,0dh
    jz de
    mov str2[di],al
    inc di
    jmp lp2
de:mov si,00h
    mov di,00h
    mov cl,len
cp:mov al, str1[si]
    mov bl, str2[di]
    cmp al, bl
    jne Not_Equal
    inc si
    inc di
    dec cl
    jne cp
    
    jmp Equal

    Not_Equal:
       display strnequ
       jmp exit  
    Equal:
       display strequ
       
       Exit:
       mov ax, 4c00h
       int 21h
end
    
