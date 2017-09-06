#########################################################
#                                                       #
# Program: To print Hello World                         #
# Name   : Mishal Shah                                  #
# RollNo : 16CO125                                      #
# Date   : 01/09/2017                                   #
#                                                       #
#########################################################


.data
	message: .asciiz "Hello World\n"

.text
.globl main

main:
	li $v0, 4
	la $a0, message
	syscall