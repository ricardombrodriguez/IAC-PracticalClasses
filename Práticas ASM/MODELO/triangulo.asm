#verificar se triângulo é equilatero, isosceles ou escaleno

.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
str1:	.asciiz "Insira o tamanho dos lados do triângulo: "
result1: .asciiz "O triângulo é equilátero "
result2: .asciiz "O triângulo é isosceles "
result3: .asciiz "O triângulo é escaleno "

.text
.globl main
main:
	la $a0,str1
	li $v0,print_string
	syscall
	li $v0,read_int
	syscall
	move $t0,$v0
	li $v0,read_int
	syscall
	move $t1,$v0
	li $v0,read_int
	syscall
	move $t2,$v0
	
	bne $t0,$t1,verif1
	bne $t1,$t2,isos
	la $a0,result1
	li $v0,print_string
	syscall
	j exit
	
verif1:	beq $t1,$t2,isos
	beq $t0,$t2,isos
	la $a0,result3
	li $v0,print_string
	syscall
	j exit

isos:	la $a0,result2
	li $v0,print_string
	syscall
	j exit

exit:	li $v0,done
	syscall