	.data
char: 	.byte	' '
	
	.text
	.globl main

main:	lui	$t1,0x1234
	ori 	$t1,0x5678
	andi 	$t2,$t1,0xF0000000
	srl 	$a0,$t2,28
	li 	$v0,34
	syscall
	
	la	$a0,char
	li	$v0,11
	syscall
	
	andi	$t2,$t1,0x0F000000
	srl	$a0,$t2,24
	li	$v0,4
	syscall
	
	la	$a0,char
	li	$v0,11
	syscall
	
	li	$v0,10
	syscall
	