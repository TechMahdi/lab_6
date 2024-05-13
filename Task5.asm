Take input the length of the user’s name. Then, take the name as input, and
display it.

.model small
.stack 100h
.data 
 x db 10 DUP(?) 
 size db ?
 msg dw "Enter User Name Length:$"
.code
main proc
 mov ax,@data 
 mov ds,ax
 
 
 mov ah,9
 lea dx,msg
 int 21h
 
 mov ah,1 
 
 int 21h 
 sub al,30h
 mov size,al
 
 mov ah,2
 mov dl,0ah
 int 21h
 mov dl,0dh
 int 21h
 
 
 mov bl,size 
 mov ah,1
 mov si,offset x 
 start:
 cmp bl,0

 je second 
 int 21h 
 sub al,30h
 mov x[si],al
 inc si
 dec bl
 loop start 
 
 second:
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h 
 
 mov ah,2
 mov bl,size 
 mov si,offset x
 loop2:
 cmp bl,0
 je exit 
 mov dl,x[si]
 add dl,30h
 int 21h 
 inc si
 dec bl
 loop loop2 
 
 
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
