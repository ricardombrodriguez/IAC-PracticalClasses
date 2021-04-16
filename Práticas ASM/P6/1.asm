#Registo $t0
lui	$t0,0x1234
ori 	$t0,0x5678

#Registo $t1
addi	$t1,$0,15

#Operações entre registos
and	$t2,$t0,$t1
or	$t3,$t0,$t1
nor	$t4,$t0,$t1
xor	$t5,$t0,$t1

#########################

#Registo $t0
lui	$t0,0x1234
ori 	$t0,0x5678

#Registo $t1
ori	$t1,$0,0xF000

#Operações entre registos
and	$t2,$t0,$t1
or	$t3,$t0,$t1
nor	$t4,$t0,$t1
xor	$t5,$t0,$t1

#########################

#Registo $t0
lui	$t0,0x1234
ori 	$t0,0x5678

#Registo $t1
ori	$t1,$0,0xABCD

#Operações entre registos
and	$t2,$t0,$t1
or	$t3,$t0,$t1
nor	$t4,$t0,$t1
xor	$t5,$t0,$t1

#Not bitwise
not 	$t6,$t0

