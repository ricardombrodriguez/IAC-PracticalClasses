.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
str:	.space	50
prompt: .asciiz "Insira a frase: "
result: .asciiz "\nDígitos na frase: "

.text
.globl main
main:
	la $a0,prompt
	li $v0,print_string
	syscall
	la $a0,str
	li $a1,50
	li $v0,read_string
	syscall
	la $t1,str
	li $t3,0
	
for:
	lb $t2,0($t1)
	beq $t2,'\0',end
	blt $t2,'0',case
	bgt $t2,'9',case
	addi $t3,$t3,1
	addi $t1,$t1,1
	j for
	
case:
	addi $t1,$t1,1
	j for
	
end:
	la $a0,result
	li $v0,print_string
	syscall
	move $a0,$t3
	li $v0,print_int10
	syscall
	li $v0,done
	syscall
	
	