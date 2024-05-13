Take an array of size 5. Store random numbers in it. Then, take two more
inputs from the user. First input being an index of the array, the second being a
random number. After this, add the given input to the value of index of the array.
Now print the array in the next line.

.model small
.stack 100h
.data 
 x db 10 DUP(?) 
 msg dw "Enter the array(5) Numbers: $" 
 msg2 dw "Index of the Array: $"
 msg3 dw "Number want to change: $"
 num1 dw ?
 num2 db ?
.code
main proc
 mov ax,@data 
 mov ds,ax
 
 mov ah,9
 lea dx,msg
 int 21h
 
 mov cx,5 
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
 mov ah,9
 lea dx,msg2
 int 21h
 
 mov ah,1
 int 21h
 sub ax,30h
 mov ah,0
 mov num1, ax 
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 
 mov ah,9

lea dx,msg3
 int 21h
 mov ah,1
 int 21h 
 sub al,30h
 mov num2,al
 
 xor ax,ax
 mov bx,num1 
 mov si,bx
 mov si,offset x 
 mov cx,5
 
 loop2: 
 
 mov dl,x[si] 
 mov bx,num1
 cmp si, bx 
 je swap
 inc si
 loop loop2
 
 
 swap: 
 xor bh,bh 
 mov bx,num1 
 mov si,bx 
 mov bx,0
 mov bl,num2
 mov x[si],bl
 
 mov ah,2
 mov dl,0dh
 int 21h
 mov dl,0ah
 int 21h
 xor dx,dx
 mov cx,5
 mov si, offset x
 
 loop3:
 mov dl,x[si] 
 add dl,30h
 int 21h
 inc si
 loop loop3 
 
 exit:
 mov ah,4ch
 int 21h
 main endp
end main
