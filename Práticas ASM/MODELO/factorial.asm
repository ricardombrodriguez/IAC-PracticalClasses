.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
str1:	.asciiz "Insira um número: "
str2: 	.asciiz "Fatorial: "

.text
.globl main
main:
	la $a0,str1
	li $v0,print_string
	syscall
	
	li $v0,read_int
	syscall
	move $t0,$v0	#t0 -> número introduzido
	li $t2,1	#fact

for:	
	ble $t0,0,end
	mul $t2,$t2,$t0 #fact = fact * i
	addi $t0,$t0,-1
	j for
	
end:
	la $a0,str2
	li $v0,print_string
	syscall
	move $a0,$t2
	li $v0,print_int10
	syscall
	li $v0,done
	syscall
	
	
	