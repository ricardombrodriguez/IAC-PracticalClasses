.data
frase:	.ascii	"Te3m In5tei1ros Mis8tura9dos"
msg:	.ascii	"\nO nr de alfas �: "

.text
.globl main
main:
	la	$a0,msg
	li	$v0,4
	syscall
	