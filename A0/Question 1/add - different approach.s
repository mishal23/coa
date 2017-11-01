###################################
#
# Program: To add two constants
# Name 	 : Mishal Shah
# RollNo : 16CO125
# Date   : 02/09/2017
# 
###################################

.data
	number1: .word 1000000	# number1 = 1000000
	number2: .word 2000000	# number1 = 2000000

.text
.globl main

main:
	lw $s0, number1		# s0 = number1
	lw $s1, number2		# s1 = number2

	add $t0, $s0, $s1 	 # t0 = s0 + s1
	
# To display the result
	li $v0, 1
	move $a0, $t0
	syscall
