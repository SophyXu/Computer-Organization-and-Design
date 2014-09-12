# $s5 $s6 
# $s3 $s4
# $t5 
# $t6
# $t7
# $t3 $t2 $t1 $t0
# $s0
# $s1
# #a1

# $t4 $a0 $a2  $a3



# initialization
lui $t3, 0xE000		#常数定义
lui $t1, 0xF000
addi $s1, $s1, 10000
add $t5, $zero, $zero
	
lui $s5, 0xDFFF 	# 1101 1111 1111 1111 1100 1111 1111 1000
lui $s6, 0xCFF8
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

lui $s3, 0xFFFF 	# 1111 1111 1111 1111 0111 1111 1111 1111
lui $s4, 0x7FFF
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
or $t6, $s3, $s4

and $t2, $t6, $t7
sw $t2, 0($t3)

START:

NEXT:add $s0, $zero, $zero
COUNT:addi $s0, $s0, 1
############################################################################
lw $t0, 0($t1)

add $a1, $zero, $zero
addi $a1, $zero, 0x0008   #判断:sw:01      0000 0000 0000 1000
and $a1, $a1, $t0
bne $a1, $zero, DOWN 

add $a1, $zero, $zero
addi $a1, $zero, 0x0010   #判断:sw:10      0000 0000 0001 0000
and $a1, $a1, $t0
bne $a1, $zero, UP 
j MID

DOWN:
lui $s3, 0x7FFF
lui $s4, 0xFFFF   # 0111 1111 1111 1111 1111 1111 1111 1111
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
or $t6, $s3, $s4
and $t2, $t6, $t7
sw $t2, 0($t3)
j CONTINUE

UP:
lui $s3, 0xFFFF
lui $s4, 0xFFF7   # 1111 1111 1111 1111 1111 1111 1111 0111
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
or $t6, $s3, $s4
and $t2, $t6, $t7
sw $t2, 0($t3)
j CONTINUE

MID:
lui $s3, 0xFFFF
lui $s4, 0x7FFF   # 1111 1111 1111 1111 0111 1111 1111 1111
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
srl $s4, $s4, 1
or $t6, $s3, $s4
and $t2, $t6, $t7
sw $t2, 0($t3)
j CONTINUE
######################################################################

CONTINUE:
bne $s0, $s1, COUNT
addi $t5, $t5, 1

####################    judege     #####################
lui $a0, 0xC000
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
and $a0, $a0, $t2
beq $a0, $zero, FAIL

lui $a0, 0xA000
and $a0, $a0, $t2
beq $a0, $zero, FAIL

addi $a0, $zero, 0x000C
and $a0, $a0, $t2
beq $a0, $zero, FAIL
####################    judege     #####################


addi $s2, $zero, 1
beq $t5, $s2, ONE
addi $s2, $zero, 2
beq $t5, $s2, TWO
addi $s2, $zero, 3
beq $t5, $s2, THREE
addi $s2, $zero, 4
beq $t5, $s2, FOUR
addi $s2, $zero, 5
beq $t5, $s2, FIVE
addi $s2, $zero, 6
beq $t5, $s2, SIX
addi $s2, $zero, 7
beq $t5, $s2, SEV
addi $s2, $zero, 8
beq $t5, $s2, EIGHT
addi $s2, $zero, 9
beq $t5, $s2, NINE
addi $s2, $zero, 10
beq $t5, $s2, TEN
addi $s2, $zero, 11
beq $t5, $s2, OVER

ONE:
lui $s5, 0xFDFF 	# 1111 1101 1111 1111 1000 1111 1111 1001
lui $s6, 0x8FF9
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

TWO:
lui $s5, 0xF5FF 	# 1111 0101 1111 1111 1001 1111 1111 1010
lui $s6, 0x9FFA
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

THREE:
lui $s5, 0xD7FF 	# 1101 0111 1111 1111 1010 1111 1111 1100
lui $s6, 0xAFFC
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

FOUR:
lui $s5, 0xDDFF 	# 1101 1101 1111 1111 1100 1111 1111 1001
lui $s6, 0xCFF9
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

FIVE:
lui $s5, 0xF5FF 	# 1111 0101 1111 1111 1001 1111 1111 1010
lui $s6, 0x9FFA
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

SIX:
lui $s5, 0xD7FF 	# 1101 0111 1111 1111 1011 1111 1111 1100
lui $s6, 0xBFFC
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

SEV:
lui $s5, 0xDDFF 	# 1101 1101 1111 1111 1101 1111 1111 1000
lui $s6, 0xDFF8
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

EIGHT:
lui $s5, 0xF7FF 	# 1111 0111 1111 1111 1010 1111 1111 1000
lui $s6, 0xAFF8
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

NINE:
lui $s5, 0xDFFF 	# 1101 1111 1111 1111 1101 1111 1111 1001
lui $s6, 0xDFF9
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

TEN:
lui $s5, 0xFFFF 	# 1111 1111 1111 1111 1011 1111 1111 1011
lui $s6, 0xBFFB
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
srl $s6, $s6, 1
or $t7, $s5, $s6

and $t2, $t6, $t7
sw $t2, 0($t3)
j START

OVER:
lui $a0, 0xC000
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
srl $a0, $a0, 1
and $a0, $a0, $t2
beq $a0, $zero, FAIL

lui $a0, 0xA000
and $a0, $a0, $t2
beq $a0, $zero, FAIL

addi $a0, $zero, 0x000C
and $a0, $a0, $t2
beq $a0, $zero, FAIL
j PASS

FAIL:
lui $a3, 0xFD49     # 1111 1101 0100 1001 0011 0100 1001 0011
addi $a3, $a3, 0x3493
sw $a3, 0($t3)
j FAIL

PASS:
lui $a3, 0xF54A
addi $a3, $a3, 0x0050
sw $a3, 0($t3)
j PASS
