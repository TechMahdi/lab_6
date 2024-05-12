model small
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
 inc si
 loop start 
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h 
 
 mov ah,2
 mov cx,10 
 mov si,9
 loop2: 
 mov dl,x[si]
 add dl,30h
 int 21h 
 dec si
 loop loop2 
 
 
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
