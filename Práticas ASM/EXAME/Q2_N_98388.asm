# ------------------------------------------------------------------
# DEP. ELECTR?NICA, TELECOMUNICA??ES E INFORM?TICA - Univ. Aveiro
# Teste Pr?tico 2 de IAC - 13 de Junho de 2020
# 
# NOME: Ricardo Manuel Batista Rodriguez N? 98388
# ------------------------------------------------------------------
# NOTA: Use este ficheiro para responder ?quest?o 2.
# int func2( char* )
# void main( void ) {
# static char* msg1 = "Hoje, o ceu ESTA LIMPO!\n" ; 
# static char* msg2 = "O comprimento e: " ;
# int n; 
# 	n = func2(msg1);
# 	print_str(msg1);
# 	print_str(msg2);
# 	print_int10( n );		
# 	exit();
# }

# -------------------	
	.eqv	PRINT_INT10,1	
	.eqv	PRINT_STR,4
	.eqv	EXIT,10		
#		
	.data
	
msg1:	.asciiz "Hoje, o ceu ESTA LIMPO!\n"
msg2:	.asciiz "O comprimento e: "	

	.text
	.globl main
#Insira a partir daqui a codifica??o da fun??o main
# -------------------------------------------------
# Registos:
# ----------
# Vari?vel |  Registo(s)
#   msg1   |     $a0
#   msg2   |     $a0
#    n 	   |   	 $t0	
#	   |

main:
	la $a0,msg1		#armazenar endereço de 'msg1' no registo $a0, que serve de argumento para a func2
	jal func2		#func2(msg1)
	move $t0,$v0		#armazenar o valor de retorno da func2 em $t0
	la $a0,msg1		#armazenar o endereço da msg1 no $a0 e dar print
	li $v0,PRINT_STR
	syscall
	la $a0,msg2		#armazenar o endereço da msg2 no $a0 e dar print
	li $v0,PRINT_STR
	syscall
	move $a0,$t0		#mover o conteudo de $t0, que é o valor de n, para $a0 e dar print do número em decimal
	li $v0,PRINT_INT10
	syscall
	li $v0,EXIT		#acabar o programa
	syscall



# Coloque o c?digo de func2 a partir daqui
# ------------------------------------------------ 
# ------------------- C?digo C -------------------
# int func2( char* str ){
#   int i=0;
# 	while( str[i] != '\0' ) {
# 	       if( (str[i] >= 'A') && (str[i] <= 'Z') ) {
# 			str[i] += 0x20;
# 		 }
# 	  i++;
# 	}
#   return i;
# }
# -------------------------------------------------
# Registos:
# ----------
# Vari?vel |  Registo(s)
#    i 	   |     $t0
#   str	   |     $a0
#  str[i]  |     $t1
#	   |
# -------------------	
func2:
	li $t0,0		#inicializar i com o valor 0
	
while:	
	lb $t1,0($a0)		# $t1 = str[i]
	beq $t1,'\0',end	# se str[i] for nulo acaba o loop
	addi $t0,$t0,1		#incrementar o valor de i, do comprimento
	blt $t1,'A',case	# se str[i] for menor que 'A' vai para case
	bgt $t1,'Z',case	# se str[i] for maior que 'Z' vai para case
	addi $t1,$t1,32		#somar 32 ao str[i] porque 0x20 em ascii é 32
	sb $t1,0($a0)		#armazenar str[i] em i
	addi $a0,$a0,1		#incrementar o endereço de $a0, para passar para o proximo byte/caractere
			
	j while			#saltar para o while
	
case:				#se for diferente de maiuscula não faz nada e só vai incrementar o $a0
	addi $a0,$a0,1		#incrementar o endereço de $a0, para passar para o proximo byte/caractere
	j while			#saltar para o while
	
end:				#mover o valor de $t0 para $v0, de forma a ser retornado ao fazer jump register
	move $v0,$t0
	jr $ra
	
	
	