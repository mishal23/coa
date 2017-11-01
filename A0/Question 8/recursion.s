#########################################################
#                                                       #
# Program: To find factorial of number using recursion  #
# Name   : Mishal Shah                                  #
# RollNo : 16CO125                                      #
# Date   : 06/09/2017                                   #
#                                                       #
#########################################################

.data
input: .asciiz "Enter a number: "
output: .asciiz "Factorial of the number is: "

.text
.globl main

main:
    # Input from user
    la $a0, input
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    addi $sp, $sp, -12   # allocate 12 bytes
    sw $t0, 0($sp)       # arg1: number n
    sw $ra, 8($sp)       # save program counter (PC)
    jal factorial
    lw $ra, 8($sp)       # restore program counter (PC)
    lw $s0, 4($sp)       # load the final return value
    addi $sp, $sp, 12    # deallocate 12 bytes

    # Printing the result
    la $a0, output
    li $v0, 4
    syscall

    move $a0, $s0
    li $v0, 1
    syscall

    li $v0, 10
    syscall

# Factorial Function
factorial:
    # Base case
    lw $t0, 0($sp)
    beq $t0, 0, return1
    addi $t0, $t0, -1

    # recursive call
    addi $sp, $sp, -12
    sw $t0, 0($sp)
    sw $ra, 8($sp)
    jal factorial

    # load the return value
    lw $t1, 4($sp)
    lw $ra, 8($sp)
    addiu $sp, $sp, 12
    
    # load n
    lw $t0, 0($sp)
    
    # n*(n-1)
    mul $t2, $t1, $t0
    sw $t2, 4($sp)
    jr $ra

return1:
    li $t0, 1
    sw $t0, 4($sp)
    jr $ra

