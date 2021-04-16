		.data
minus:		.ascii "texto em minusculas\n"
maius:		.space	20

		.text
		.globl main
		
main:		
		la $t0,0
		la $t1,minus

while:		
		add $t2,$t1,$t0
		lb $t3,0($t2)
		beq $t3,'\0',end
		bgt $t3,'z',cont
		blt $t3,'a',cont
		sub $t3,$t3,32
		la $t4,maius
		add $t5,$t4,$t0
		sb $t3,0($t5)
		addi $t0,$t0,1
		j while
		
cont:		
		la $t4,maius
		add $t5,$t4,$t0
		sb $t3,0($t5)
		addi $t0,$t0,1
		j while
		
end:		
		la $a0,maius
		li $v0,4
		syscall
		li $v0,10
		syscall
		