#################################################
# 												#
# Program: To find sum and average of an array	#
# Name 	 : Mishal Shah							#
# RollNo : 16CO125								#
# Date   : 05/09/2017							#
# 												#
#################################################

.data

array: .word 5, 6, 20, 10, 24, 56, 41, 64, 75, 83
sum: .word 0
messageforSum: .asciiz "Sum: "
messageforAverage: .asciiz "Average: "
newline: .asciiz "\n" 

.text
.globl main

main:
    li $a0, 10	    # Stored in $a0 to pass in function
    la $a1, array   # Stored in $a1 to pass in function
    jal sumofArray  # Jump to function
    sw $v0, sum

   # Display message for Sum
    la $a0, messageforSum
    li $v0, 4
    syscall

   # Display the value of Sum
    lw $a0, sum
    li $v0, 1
    syscall
   
   # To calculate the average 
    li $t0, 10
    lw $t1, sum
    div $t1, $t1, $t0

   # New Line
    la $a0, newline
    li $v0, 4
    syscall

   # Display message for Average
    la $a0, messageforAverage
    li $v0, 4
    syscall
    
   # Display the average
    add $a0, $0, $t1
    li $v0, 1
    syscall

    li $v0 10
    syscall


sumofArray:
    li $t0 0 
    li $v0 0 

loop:
    lw $t1, 0($a1)
    add $v0, $v0, $t1
    addi $t0, 1
    addi $a1, 4
    blt $t0, $a0, loop
    
    jr $ra
