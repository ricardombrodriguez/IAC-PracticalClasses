lui	$t0,0x1234
ori 	$t0,0x5678

sll	$t1,$t0,1
srl	$t2,$t0,1
sra	$t3,$t0,1

#################

sll	$t1,$t0,4
srl	$t2,$t0,4
sra	$t3,$t0,4

#################

sll	$t1,$t0,2
srl	$t2,$t0,2
sra	$t3,$t0,2

#################

lui $t0,0xF000
ori $t0,0x0003

sll	$t1,$t0,4
srl	$t2,$t0,4
sra	$t3,$t0,4