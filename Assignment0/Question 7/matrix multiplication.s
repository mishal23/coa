#########################################
# 										#
# Program: To multiply two matrices   	#
# Name 	 : Mishal Shah					#
# RollNo : 16CO125						#
# Date   : 06/09/2017					#
# 										#
#########################################

.data

matrix1: .space 400
matrix2: .space 400
mxA: .space 400
hdr: .asciiz "\nMatrix Multiplication Program"
ip1: .asciiz "\nEnter dimensions of matrix 1 [a][b]\n"
ip2: .asciiz "\nEnter dimensions of matrix 2 [m][n]\n"
ip11: .asciiz "\nEnter elements of matrix 1 (row wise)\n"
ip22: .asciiz "\nEnter elements of matrix 2 (row wise)\n"
newLine: .asciiz "\n"
spaces: .asciiz "   "
display1: .asciiz "\nMatrix 1 \n"
display2: .asciiz "\nMatrix 2 \n"
displayA: .asciiz "\nMatrix Multiplication \n"
error: .asciiz "\n\n Error! Matrix can't be multiplied."
m1: .word 0
m2: .word 0
n1: .word 0
n2: .word 0

.text

.globl  main
.ent main
main:
    # $s0 -> Base address of matrix1
    # $s1 -> m1
    # $s2 -> n1
    # $s3 -> Base address of matrix2
    # $s4 -> m2
    # $s5 -> n2

    # Display header
    la $a0, hdr
    li $v0, 4
    syscall

    # Input Matrix 1
    la $a0, ip1
    syscall

    # Get a and b
    li $v0, 5
    syscall
    sw $v0, m1

    li $v0, 5
    syscall
    sw $v0, n1

    # Input matrix1 elements
    la $a0, ip11
    li $v0, 4
    syscall

    la $a1, matrix1
    lw $a2, m1
    lw $a3, n1

    jal input_mx

    la $a0, display1
    li $v0, 4
    syscall
    jal display_mx

    # Input matrix 2
    la $a0, ip2
    li $v0, 4
    syscall

    # Get m and n
    li $v0, 5
    syscall
    sw $v0, m2

    li $v0, 5
    syscall
    sw $v0, n2

    # Input matrix2 elements
    la $a0, ip22
    li $v0, 4
    syscall

    la $a1, matrix2
    lw $a2, m2
    lw $a3, n2

    jal input_mx

    la $a0, display2
    li $v0, 4
    syscall
    jal display_mx

    # Set up for mx_mult
    la $a1, matrix1
    la $a2, matrix2
    la $a3, mxA

    lw $t0, m1
    lw $t1, n1
    lw $t2, m2
    lw $t3, n2

    jal mx_mult

    # Set up for displaying output
    la $a1, mxA
    lw $a2, m1
    lw $a3, n2

    la $a0, displayA
    li $v0, 4
    syscall
    jal display_mx

    li $v0, 10     #$v0  10
    syscall

.end main

# Input Matrix Function

.globl input_mx
.ent input_mx
input_mx:

    li $t0, 0      # i = 0
    i_loop:
        beq $t0, $a2, i_loop_done

        li $t1, 0      # j = 0
        j_loop:
            beq $t1, $a3, j_loop_done

            mult $a3, $t0
            mflo $t2             # t2 = n*i
            add $t2, $t2, $t1   
            sll $t2, $t2, 2     
            addu $t2, $t2, $a1

            li $v0, 5
            syscall

            sw $v0, 0($t2)

            addi $t1, $t1, 1
            b j_loop
        j_loop_done:

        addi $t0, $t0, 1
        b i_loop
    i_loop_done:

    jr $ra

.end input_mx

.globl display_mx
.ent display_mx
display_mx:

    # Arguments:
    # a1 -> base address of input mx
    # a2 -> m
    # a3 -> n

    # Registers used:
    # v0 -> input value from user

    # for ( i = 0; i < m; i++ )
    #   for ( j = 0; j < n; j++ )
    #       display a[i][j]
    #   \n

    li $t0, 0      # i = 0
    i_loop2:
        beq $t0, $a2, i_loop2_done
        li $t1, 0      # j = 0

        j_loop2:
            beq $t1, $a3, j_loop2_done

            mult $a3, $t0
            mflo $t2             # t2 = n*i
            add $t2, $t2, $t1   # t2 += j
            sll $t2, $t2, 2     # t2 *= 4
            addu $t2, $t2, $a1
 
            lw $a0, 0($t2)
            li $v0, 1
            syscall

            la $a0, spaces
            li $v0, 4
            syscall

            addi $t1, $t1, 1
            b j_loop2

        j_loop2_done:

        la $a0, newLine
        li $v0, 4
        syscall

        addi $t0, $t0, 1
        b i_loop2

    i_loop2_done:
    jr $ra

.end display_mx

# Matrix Multiplication function

.globl mx_mult
.ent mx_mult
mx_mult:

    # Arguments:
    # a1 -> base address of matrix1
    # a2 -> base address of matrix2
    # a3 -> base address of answer mxA
    #
    # t0 -> m1
    # t1 -> n1
    # t2 -> m2
    # t3 -> n2
    #
    # check for t1 == t2
    # iloop limit = t0
    # jloop limit = t3
    # kloop limit = t2
    #
    # t4 -> i
    # t5 -> j
    # t6 -> k
    #
    # t7 -> *(a3 + 4*(n2*i + j)) -> mxA[i][j]
    # t8 -> *(a1 + 4*(n1*i + k)) -> matrix1[i][k]
    # t9 -> *(a2 + 4*(n2*k + j)) -> matrix2[k][j]

    bne $t1, $t2, errordone

    li $t4, 0
    i_loop3:
        bge $t4, $t0, i_loop3_done

        li $t5, 0
        j_loop3:
            bge $t5, $t3, j_loop3_done

            mult $t3, $t4
            mflo $t7             # t7 = n2*i
            add $t7, $t7, $t5   # t7 += j
            sll $t7, $t7, 2     # t7 *= 4
            addu $t7, $t7, $a3

            li $t6, 0
            li $s3, 0
            k_loop3:
                bge $t6, $t2, k_loop3_done

                mult $t1, $t4
                mflo $t8             # t8 = n1*i
                add $t8, $t8, $t6   # t8 += k
                sll $t8, $t8, 2     # t8 *= 4
                addu $t8, $t8, $a1
                mult $t3, $t6
                mflo $t9             # t9 = n2*k
                add $t9, $t9, $t5   # t9 += j
                sll $t9, $t9, 2     # t9 *= 4
                addu $t9, $t9, $a2

                lw $s0, 0($t8)
                lw $s1, 0($t9)

                mult $s0, $s1
                mflo $s2

                addu $s3, $s3, $s2
                addi $t6, $t6, 1

                b k_loop3

            k_loop3_done:

            sw $s3, 0($t7)
            addi $t5, $t5, 1

            b j_loop3
        j_loop3_done:

        addi $t4, $t4, 1
        b i_loop3
    i_loop3_done:
    jr $ra

errordone:
    la $a0, error
    li $v0, 4
    syscall

    jr $ra

.end mx_mult
