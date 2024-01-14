[org 0x0100]
jmp start
find_max:S
	mov cx,10
	mov dx,[bx]
	
compare:
	cmp dx,[bx+2]
	jle next
	jmp noswap
	
next:
	mov dx,[bx+2]
	
noswap:
	add bx,2
	sub cx,1
	cmp cx,1
	jne compare
	ret
	
start:
	mov bx,array1
	call find_max
	mov [result],dx
	
	mov bx,array2
	call find_max
	mov [result+2],dx
	
	mov bx,array3
	call find_max
	mov [result+4],dx
	
	mov bx,array4
	call find_max
	mov [result+6],dx
	
	mov bx,array5
	call find_max
	mov [result+8],dx
	
	mov ax,0x4c00
	int 0x21
array1: dw 1,2,33,4,5,6,7,8,9,10
array2: dw 1,12,3,55,5,6,66,8,9,10
array3: dw 1,2,3,4,5,77,7,8,9,10
array4: dw 1,2,3,88,5,6,7,8,9,10
array5: dw 1,2,3,4,99,6,7,8,9,10
result: dw 0,0,0,0,0
