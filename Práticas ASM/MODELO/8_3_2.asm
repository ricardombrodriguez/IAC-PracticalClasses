.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
lista:	.space 24
str1: 	.asciiz "Insira 6 números: "
str2:	.asciiz "Lista de numeros: "
sep:	.asciiz " - "

.text
.globl main
main:
	la $a0,str1
	li $v0,print_string
	syscall
	li $t0,0
	la $t1,lista
	
for1:
	bge $t0,6,end1
	li $v0,read_int
	syscall
	sw $v0,0($t1)
	addi $t1,$t1,4
	addi $t0,$t0,1
	j for1
	
end1:
	la $a0,str2
	li $v0,print_string
	syscall
	li $t0,0
	la $t1,lista
	
	
for2:
	bge $t0,6,end2
	lw $a0,0($t1)
	li $v0,print_int10
	syscall
	beq $t0,5,end2
	la $a0,sep
	li $v0,print_string
	syscall
	addi $t1,$t1,4
	addi $t0,$t0,1
	j for2
	
end2:
	li $v0,done
	syscall
	
	

