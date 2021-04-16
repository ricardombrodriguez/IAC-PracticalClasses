		.data
prompt:		.asciiz "Introduza um numero: "
result:		.asciiz "\nO número em hexadecimal é: "
		
		.text
		.globl main
main:		la $a0,prompt
		li $v0,4
		syscall
		
		li $v0,5
		syscall
		move $t0,$v0		#$t0 = num
		
		addi $t1, $0, 0		#$t1 = n
		addi $t4, $0, 8
		lui $t5,0XF000
		
for:		slt $t2,$t1,$t4
		beqz $t2,end
		srl $t3,$t0,1
		la $a0,result
		li $v0,4
		syscall
		move $a0,$t3
		li $v0,34
		syscall
		sll $t0,$t0,1
		addi $t1,$t1,1
		j for
		
end:		li $v0,10
		syscall