.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
num:	.space 4
prompt: .asciiz "Introduza um número: "
result: .asciiz "\nO número em hexadecimal é: "

.text
.globl main
main:
	la $a0,prompt
	li $v0,print_string
	syscall
	li $v0,read_int
	syscall
	move $t1,$v0
	la $a0,result
	li $v0,print_string
	syscall
	move $a0,$t1
	li $v0,print_int16
	syscall
	li $v0,done
	syscall	