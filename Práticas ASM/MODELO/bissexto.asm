#verificar se é ano bissexto
.data
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	.eqv read_string, 8
	.eqv print_int10, 1
	.eqv print_intu10, 36
	.eqv print_int16, 34
	.eqv done, 10
str1:	.asciiz "Ano: "
result1: .asciiz "Ano bissexto"
result2: .asciiz "Ano não bissexto"

.text
.globl main
main:
	la   $a0,str1
	li   $v0,print_string
	syscall
	li   $v0,read_int
	syscall
	move $t0,$v0
	
is_leap_year:
	li   $t1, 4		# Loading 4 into t1 in order to divide a year by it.
	div  $t0, $t1		# Dividing year by 4.
	mfhi $t1		# Loading the reminder to t1.
	bnez $t1, not_leap	# If we have a reminder there is not a leap year.
	
	li   $t1, 100
	div  $t0, $t1		# Now we divide a year by 100 .
	mfhi $t1
	bnez $t1, is_leap	# If we have a year which is not divisible by 100 we have a leap year.
	
	li   $t1, 400
	div  $t0, $t1
	mfhi $t1
	bnez $t1, not_leap	# If we have a year which is divisible by 4 and 100 but not by 400 we dont have a leap year.
	
	
	

is_leap:
	li $v0, 1
	j  end

	
not_leap:
	li  $v0, 0
	
end:
	jr  $ra
