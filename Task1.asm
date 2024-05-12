Find the sum of the elements of a BYTE array of size 10 by taking input from
user.
.model small
.stack 100h
.data 
 x db 10 DUP(?)
.code
main proc
 mov ax,@data 
 mov ds,ax
 
 mov bl,0
 mov cx,10 
 
 mov ah,1
 mov si,offset x 
 start: 
 
 
 int 21h 
 sub al,30h
 mov x[si],al
 add bl,al
 inc si
 loop start 
 
 
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
