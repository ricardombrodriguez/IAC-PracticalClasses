		.data
		
prompt:		.asciiz "Introduza um número:\n"
hifen:		.asciiz " - "

		.text
		.globl main
		
main:		addi $t0,$0,0	#$t0 = 0 (i)
		la $a0,prompt
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		move $t1,$v0	#$t1 = a
		
for:		slt $t2,$t0,$t1
		beq $t2,$0,exit
		
		move $a0,$t0
		li $v0,1
		syscall
		
		la $a0,hifen
		li $v0,4
		syscall
		
		addi $t0,$t0,1
		j for
		
exit:		li $v0,10
		syscall