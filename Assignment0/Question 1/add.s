###################################
# Program: To add two constants
# Name 	 : Mishal Shah
# RollNo : 16CO125
# Date   : 02/09/2017
# 
###################################

.data
	number1: .word 100000000   # number1 = 100000000
	number2: .word 200000000   # number2 = 200000000

.text
.globl main

main:
	lw $t0, number1   	# t0 = number1
	lw $t1, number2		# t1 = number2

	add $t2, $t0, $t1 	 # t2 = t0 + t1
	
# To display the result
	li $v0, 1
	add $a0, $zero, $t2
	syscall
