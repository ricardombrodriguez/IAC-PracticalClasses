.data	
tam:	.asciiz "Número de termos: "
sfibo:	.asciiz "Série de Fibonacci: "
	
.text
.globl main
main:
	la 	$a0,tam  
	li 	$v0,4
	syscall
	
	li 	$v0,5    
	syscall
	move 	$t2,$v0   
	
	move 	$a0,$t2
	move 	$v0,$t2
	jal fib     
	move 	$t3,$v0    

	la 	$a0,sfibo
	li 	$v0,4
	syscall

	move 	$a0,$t3 
	li 	$v0,1
	syscall
	
	li 	$v0,10
	syscall
	
fib:
	beqz 	$a0,zero  	#se for 0 retorna 0
	beq 	$a0,1,um   	#se for 1 retorna 1
	
	#fib(n-1)
	sub 	$sp,$sp,4   	#add espaço na stack
	sw 	$ra,0($sp)
	
	sub 	$a0,$a0,1  	
	jal 	fib     	#fib(n-1)
	add 	$a0,$a0,1
	
	lw 	$ra,0($sp)   	
	add 	$sp,$sp,4
	
	
	sub 	$sp,$sp,4   	
	sw 	$v0,0($sp)
	
	#fib(n-2)
	sub 	$sp,$sp,4   	
	sw 	$ra,0($sp)

	sub 	$a0,$a0,2   	
	jal 	fib     	#fib(n-2)
	add 	$a0,$a0,2
	
	#valor de f(n-2)
	lw	$ra,0($sp)   	
	add 	$sp,$sp,4

	#valor de f(n-1)
	lw 	$s7,0($sp)   	
	add 	$sp,$sp,4

	add 	$v0,$v0,$s7 	#f(n-2)+fib(n-1)
	jr 	$ra 		#retornar o valor da série de fibonacci

zero:				#retorna 0
	li 	$v0,0
	jr 	$ra
um:				#retorna 1
	li 	$v0,1
	jr 	$ra