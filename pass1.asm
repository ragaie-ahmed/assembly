.model small 
.data
msg db "enter the password",10,13,"$"
msg1 db 10,"the password is valid ",10,13,"$"
msg2 db  10,"the password is invalid ",10,13,"$"
pass db "ragaie",10,13,"$"


msg4 db 10,13,"enter the decimal number","$"
msg5  db 10,13,"binary numbe is:","$"



.code 
main proc
.startup

lea dx, msg
mov ah,09h
int 21h

lea si,pass
mov cx,6
mov ah,01h
l1:

int 21h
cmp al,[si]
jne l3
inc si
loop l1

l2:
lea dx,msg1
mov ah,09h
int 21h
jmp stop

l3:
lea dx,msg2
mov ah,09h
int 21h
stop:



mov ah,09h
lea dx,msg4
int 21h

mov ah,01
int 21h

sub al,48
mov ah,0
mov bx,2
mov dx,0
mov cx,0

lb1:
div bx
push dx
inc cx
cmp ax,0
jne lb1


 lea dx,msg5
mov ah,09h
int 21h
lb2:
pop dx
add dx,48
mov ah,02
int 21h
loop lb2

.exit 

main endp

end main