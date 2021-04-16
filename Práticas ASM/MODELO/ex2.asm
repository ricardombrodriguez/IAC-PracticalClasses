.data
	.eqv	printstr,4
	.eqv	printint,1
	.eqv	readstr,8
str:	.space	50
text1:	.asciiz "Insira uma string: "
text2: 	.asciiz "\nNumero de caracteres na string: "

.text
.globl main
main:	
	la	$a0,text1
	li	$v0,printstr
	syscall
	la	$a0,str
	li	$a1,50
	li	$v0,readstr
	syscall
	move	$t1,$a0	 #i
	li	$t3,0	 #n
	
while:
	lb	$t2,0($t1)
	beq	$t2,'\0',end
	beq	$t2,' ',space
	addi	$t3,$t3,1
	addi	$t1,$t1,1
	j	while
	
space:
	addi	$t1,$t1,1
	j	while
	
end:	
	la	$a0,text2
	li	$v0,printstr
	syscall
	sub	$t3,$t3,1
	move	$a0,$t3
	li	$v0,printint
	syscall
	
	
	