		.data
prompt1:	.asciiz "Introduza um n�mero\n"
strpar:		.asciiz "O n�mero � par\n"
strimpar:	.asciiz "O n�mero � �mpar\n"

###############################################

		.text
		.globl main
		
main:		la $a0,prompt1
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		move $t0,$v0
		
		and $t1,$t0,1
		beq $t1,0,par
		la $a0,strimpar
		li $v0,4
		syscall
		j exit
		
		
par:		la $a0,strpar
		li $v0,4
		syscall
		j exit
		
exit:		li $v0,10
		syscall