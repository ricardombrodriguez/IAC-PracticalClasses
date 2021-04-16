	.data
result:	.asciiz "\nA soma dos dois números é: "
prompt: .asciiz "Introduza dois números: "
	
	.text
	.globl main
main:	la 	$a0,prompt
	li 	$v0,4
	syscall
	
	li	$v0,5
	syscall
	move	$t0,$v0
	
	li	$v0,5
	syscall
	move	$t1,$v0
	
	la	$a0,result
	li	$v0,4
	syscall
	
	add	$a0,$t0,$t1
	li	$v0,1
	syscall
	
	li	$v0,10
	syscall
	
	
	


