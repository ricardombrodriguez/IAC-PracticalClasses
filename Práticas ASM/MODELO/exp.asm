.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
base:	.space	4
exp:	.space	4
str1:	.asciiz "Base: "
str2:	.asciiz	"Expoente: "
str3:	.asciiz "Número: "

.text
.globl	main
main:
	la $a0,str1
	li $v0,print_string
	syscall
	
	li $v0,read_int
	syscall
	move $t0,$v0
	la $t2,base
	sw $t0,0($t2)
	
	la $a0,str2
	li $v0,print_string
	syscall
	
	li $v0,read_int
	syscall
	move $t1,$v0
	la $t3,exp
	sw $t1,0($t3)
	
	# t0 -> base / t1 -> expoente
	
zero:	bne $t1,0,x_to_y
	li $t5,1
	
	la $a0,str3
	li $v0,print_string
	syscall
	
	move $a0,$t5
	li $v0,print_int10
	syscall
	
	li $v0,done
	syscall
	
x_to_y:	addi $t1,$t1,-1
	sllv $t4,$t0,$t1
	
	la $a0,str3
	li $v0,print_string
	syscall
	
	move $a0,$t4
	li $v0,print_int10
	syscall
	
	li $v0,done
	syscall
	
	
