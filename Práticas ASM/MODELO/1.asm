.data
	.eqv SIZE,8
nums:	.word -2, 3, 6, 4, 8, 126, -131, 17
virg:	.ascii ","

.text
.globl main
main:	
	addi 	$t0,$0,0
	la	$t1,nums
	
	#um número i é par se (i & 1) == 0
for:	
	bge	$t0,SIZE,end
	lw	$t2,0($t1)
	andi	$t3,$t2,1
	bne	$t3,0,case
	move	$a0,$t2
	li	$v0,1
	syscall
	la	$a0,virg
	li	$v0,4
	syscall
	addi	$t0,$t0,1
	addi	$t1,$t1,4
	j 	for

case:	
	addi	$t0,$t0,1
	addi	$t1,$t1,4
	j	for
	
end:
	li	$v0,10
	syscall
	
	
	