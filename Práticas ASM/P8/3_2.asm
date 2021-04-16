.data
lista:	.space	24
print:	.asciiz "Insira 6 números: "
str:	.asciiz "\nNúmeros: \n"
sep:	.ascii  " - "
.text
.globl main
main:
	la 	$a0,print
	li 	$v0,4
	syscall
	addi 	$t0,$0,0	#$t0 = i = 0
	la	$t1,lista	#$t1 = adress da lista
	
for:	
	bge	$t0,6,end1
	li	$v0,5
	syscall
	move 	$t2,$v0
	sw	$t2,0($t1)
	addi	$t0,$t0,1
	addi	$t1,$t1,4
	j	for
	
end1:	
	addi 	$t0,$0,0
	la	$t1,lista
	la	$a0,str
	li	$v0,4
	syscall
			
for2:		
	bge	$t0,6,end
	lw	$a0,0($t1)
	li	$v0,1
	syscall
	la	$a0,sep
	li	$v0,4
	syscall
	addi	$t0,$t0,1
	addi	$t1,$t1,4
	j	for2
	
end:
	li 	$v0,10
	syscall