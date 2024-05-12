Use array to store the name (of fixed length) of the user as a sequence of
characters. Then, display the name.

.model small
.stack 100h
.data 
 x db 10 DUP(?) 
 size dw 5 
 msg dw "Enter User Name in 5 character:$"
.code
main proc
 mov ax,@data 
 mov ds,ax
 
 mov ah,9
 lea dx,msg
 int 21h
 
 mov bl,0
 mov cx,size 
 
 mov ah,1
 mov si,offset x 
 start: 
 
 
 int 21h 
 sub al,30h
 mov x[si],al
 inc si
 loop start 
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h 
 
 mov ah,2
 mov cx,size 
 mov si,offset x
 loop2: 
 mov dl,x[si]
 add dl,30h
 int 21h 
 inc si
 loop loop2 
 
 
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
