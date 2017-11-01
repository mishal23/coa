#########################################################
#                                                       #
# Program: To find factorial of number using loops      #
# Name   : Mishal Shah                                  #
# RollNo : 16CO125                                      #
# Date   : 06/09/2017                                   #
#                                                       #
#########################################################

.data

number: .word 7
outputmessage: .asciiz "Factorial of the number is:- "

# t1 = counter
# t2 = product

.text
.globl main

main:
    lw $t0, number
    li $t1, 1 
    li $t2, 1 
    
    loop:
        bgt $t1, $t0, end   # If greater then number, go to end
        mul $t2, $t2, $t1   # t2=t2*t1
        addi $t1, 1         # t1+=1
        j loop

    end:
        la $a0, outputmessage
        li $v0, 4
        syscall

        add $a0, $0, $t2
        li $v0, 1
        syscall

        li $v0, 10
        syscall
