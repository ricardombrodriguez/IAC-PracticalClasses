#descobrir min e max
.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
array:	.space	40 	#máximo 10 nums
str1:	.asciiz "Insira os números (para parar insira o numero 1000): \n"
str2:	.asciiz "Minimo: "
str3: 	.asciiz "\nMáximo: "

.text
.globl main
main:
	la $a0,str1
	li $v0,print_string
	syscall
	li $t0,0	#t0 -> tamanho da lista
	la $t2,array 	#t2 -> adress do array
	
while:	
	li $v0,read_int
	syscall
	beq $v0,1000,end1
	sw $v0,0($t2)
	addi $t2,$t2,4
	addi $t0,$t0,1
	j while
	
end1:	
	li $t3,1	#t3 -> i = 0
	la $t2,array
	lw $t4,0($t2)	#t4 -> min
	lw $t5,0($t2)	#t5 -> max
	addi $t2,$t2,4
	
for:
	bge $t3,$t0,end2
	lw $t6,0($t2)
	blt $t6,$t4,min
	bgt $t6,$t5,max
	addi $t2,$t2,4
	addi $t3,$t3,1
	j for
	
min:
	addi $t4,$t6,0	#min = t6
	addi $t2,$t2,4
	addi $t3,$t3,1
	j for
	
max:	
	addi $t5,$t6,0	#min = t6
	addi $t2,$t2,4
	addi $t3,$t3,1
	j for
	
end2:
	la $a0,str2
	li $v0,print_string
	syscall
	move $a0,$t4
	li $v0,print_int10
	syscall
	la $a0,str3
	li $v0,print_string
	syscall
	move $a0,$t5
	li $v0,print_int10
	syscall
	li $v0,done
	syscall