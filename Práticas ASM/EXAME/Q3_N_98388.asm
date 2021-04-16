# ------------------------------------------------------------------
# DEP. ELECTR?NICA, TELECOMUNICA??ES E INFORM?TICA - Univ. Aveiro
# Teste Pr?tico 2 de IAC - 13 de Junho de 2020
# 
# NOME: Ricardo Manuel Batista Rodriguez N? 98388
# ------------------------------------------------------------------
# NOTA: Use este ficheiro para responder ?quest?o 3).
# ------------------------------------------------ 
# ------------------- C?digo C -------------------
# void main( void ) {
# static int  oper1 = -417;
# static char oper2 = -56;
# static int  result;
#  while( oper2 < -8 ) { 
#     oper2 = oper2>>1;
#  }
#   result = oper1 - oper2;
#   print_int16( result);
#   exit();
# }
# -------------------------------------------------
# Registos:
# ----------
# Vari?vel |  Registo(s)
#  oper1   |  	 $t0	
#  &oper1  |     $t3
#  oper2   |     $t1
#  &oper2  | 	 $t4
#  result  |     $t2
#  &result |     $a0
# -------------------	
	.eqv	PRINT_INT16,34	
	.eqv	EXIT,10		
#		
	.data
	
oper1: 	.word -417
oper2:	.word -56	
result:	.space 4
	
	.text
	.globl main
main:
	#registos referidos na tabela variaveis/registos
	lw $t0,oper1	
	lw $t1,oper2
	la $t3,oper1
	la $t4,oper2

while:	#while( oper2 < -8 )
	bgt $t0,-8,end_while	#se oper2 < -8, acaba o while
	sra $t0,$t0,1		#oper2 = oper2>>1
	j while			#j while
	
end_while:			
	la $a0,result		#&result
	sub $t2,$t0,$t1		#result = oper1 - oper2
	sw $t2,0($a0)		#guardar o valor de $t2 no result
	move $a0,$t2		#mover o valor de $t2 para $a0, de forma a poder dar print
	li $v0,PRINT_INT16	#print ao oresult em hexadecimal
	syscall
	li $v0,EXIT		#acabar o programa
	syscall