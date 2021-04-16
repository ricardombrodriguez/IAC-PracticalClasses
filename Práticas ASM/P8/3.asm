.data
lista:	.word 	4,3,-2,1,27,45
str:	.asciiz "O conteúdo do Array é: \n"
hifen:	.asciiz " - "

.text
.globl main
main:	
	addi 	$t0,$0,0
	la	$t1,lista
	la	$a0,str
	li	$v0,4
	syscall
	
for:	
	bge 	$t0,6,end
	lw	$a0,0($t1)
	li	$v0,1
	syscall
	la	$a0,hifen
	li	$v0,4
	syscall
	addi	$t1,$t1,4
	addi	$t0,$t0,1
	j 	for
	
end:
	li	$v0,10
	syscall
	