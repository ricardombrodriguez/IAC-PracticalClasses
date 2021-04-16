	.data
prompt:	.asciiz "Introduza um numero: "
fact: 	.asciiz "Factorial é: "	
	.text

main: 	la  $a0, prompt
	li  $v0,4
	syscall
	
	li  $v0,5 
	syscall
	move $t0, $v0

	li  $t1 1
for:    beqz $t0, efor
	mul $t1,$t1,$t0
	
	addi $t0,$t0,-1 
	j	for
efor:
	la $a0,fact
	li $v0,4
	syscall
	
	move $a0,$t1
	li  $v0,1   
	syscall
	
	li $v0,10
	syscall
		
				
