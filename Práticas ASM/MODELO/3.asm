.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
prompt:	.asciiz "Introduza uma frase: \n"
result1:.asciiz "O número de carateres da frase1 é: "
frase1:	.space 20
frase2:	.space 20
frase3:	.space 40
	.text
	.globl main
	
main: 	la $a0, prompt
	li $v0, print_string
	syscall
	
	la $a0, frase1
	li $a1, 20
	li $v0, read_string
	syscall
	
	la $a0, prompt
	li $v0, print_string
	syscall
	
	la $a0, frase2
	li $a1, 20
	li $v0, read_string
	syscall
	
	la $a0, frase1
	jal strlen
	move $t0, $v0
	
	la $a0, result1
	li $v0, print_string
	syscall
	
	move $a0, $t0
	li $v0, print_int10
	syscall
	
	li $a0, '\n'
	li $v0, print_char
	syscall
	
	li $t2, 0
	la $a0, frase1
	la $a1, frase3
	
	jal strcpy
	move $a0, $v0	
	li $v0, print_string
	syscall
	
	la $a1, frase3
	la $a0, frase2
	
	jal strcat
	move $a0, $v0	
	li $v0, print_string
	syscall
	
exit: 	li $v0, done
	syscall	
	
#-----------------------------------------------------------------------
	
strlen:	li $t1, 0 # i

for1:	addu $t3, $a0, $t1 # load do char de ordem i (maius[i])
	lb $t4, 0($t3) # $t4 = maius[i]
	beqz $t4, ef1
	addi $t1, $t1, 1
	j for1
	
ef1: 	move $v0, $t1
	jr $ra
	
#-----------------------------------------------------------------------
	
strcpy:	li $t1, 0 # i

for2:	addu $t3, $a0, $t1 # load do char de ordem i (maius[i])
	lb $t4, 0($t3) # $t4 = maius[i]
	
	addu $t3, $a1, $t2 # load do espaço i da string maius
	sb $t4, 0($t3) # maius[i] = $t4
	
	beqz $t4, ef2
	addi $t1, $t1, 1
	addi $t2, $t2, 1
	j for2
	
ef2: 	move $v0, $a1
	jr $ra
	
#-----------------------------------------------------------------------

strcat:	addiu $sp, $sp, -4
	sw $ra, 0($sp) 
	li $t2, 0

for3:	addu $t3, $a1, $t2 # load do char de ordem i (maius[i])
	lb $t4, 0($t3) # $t4 = maius[i]
	
	beq $t4, '\n', ef3
	addi $t2, $t2, 1
	j for3
	
ef3:	jal strcpy
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
	
	
	
	
