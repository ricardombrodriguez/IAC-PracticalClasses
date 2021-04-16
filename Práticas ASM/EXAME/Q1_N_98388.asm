# ------------------------------------------------------------------
# DEP. ELECTR?NICA, TELECOMUNICA??ES E INFORM?TICA - Univ. Aveiro
# Teste Pr?tico 2 de IAC - 13 de Junho de 2020
# 
# NOME: Ricardo Manuel Batista Rodriguez N? 98388
# ------------------------------------------------------------------
# NOTA: Use este ficheiro para responder ?quest?o 1).
# ------------------------------------------------ 
# ------------------- C?digo C -------------------
# #define SIZE 8
# void main( void ) {
# static int nums[] = { 18, 3, 6, 4, -2, 26, -151, 37 };
# static char* msg = "A soma e: " ;
# int i,val,sum=0;
# 	for( i=0; i< SIZE; i++ ) {
# 		val = nums[i];
# 		if( val >0 ) sum += val;   
# 	}
#       print_str( msg ); 
#       print_int10( sum ); 	             
#       exit();
# }
# -------------------------------------------------
# Registos:
# ----------
# Vari?vel |  Registo(s)
#    i 	   |  	$t0	
# &nums[i] |    $t3
#   val	   |    $t2
#   sum	   |    $t1
# -------------------	
	.eqv	PRINT_INT10,1	
	.eqv	PRINT_STR,4
	.eqv	EXIT,10	
#		
	.data
	
nums:	.word  	18, 3, 6, 4, -2, 26, -151, 37
msg:	.asciiz	"A soma é: "
	
	.text
	.globl main
main:
	li $t0,0	#i = 0
	li $t1,0	#sum = 0
	la $t3,nums	#endereço do array 'nums'
	
for:
	#for( i=0; i< 8; i++ )
	bge $t0,8,end
	lw $t2,0($t3)		#ler a word na posição 0 do endereço de nums
	blt $t2,0,case		#jump para 'case' se for num negativo
	add $t1,$t1,$t2		#fazer a soma
	addi $t3,$t3,4		#incrementar o endereço (+4) porque é word
	addi $t0,$t0,1		#i++
	j for
	
case:
	addi $t3,$t3,4		#incrementar o endereço (+4) porque é word
	addi $t0,$t0,1		#i++
	j for
	
end:	
	#print da msg, da soma e sair do programa
	la $a0,msg
	li $v0,PRINT_STR
	syscall
	move $a0,$t1
	li $v0,PRINT_INT10
	syscall
	li $v0,EXIT
	syscall