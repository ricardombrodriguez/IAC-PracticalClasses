.data
str:	.space 50
print:	.ascii "\nCaracteres alfanuméricos: "

.text
.globl main
main:
	addi	$t0,$0,0	#$t0 = i
	addi	$t1,$0,0	#$t1 = alfas
	la	$a0,str
	li	$a1,50
	li	$v0,8
	syscall
	move	$t2,$a0

for:	
	lb	$t3,0($t2)
	beq	$t3,'\0',end
	blt	$t3,'A',case
	bgt	$t3,'z',case
	addi	$t1,$t1,1
	addi	$t2,$t2,1
	j	for
	
case:
	addi	$t2,$t2,1
	j	for
	
end:	
	la	$a0,print
	li	$v0,4
	syscall
	move	$a0,$t1
	li	$v0,1
	syscall
	li	$v0,10
	syscall
	