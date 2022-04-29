.globl matmul

.text
# =======================================================
# FUNCTION: Matrix Multiplication of 2 integer matrices
# 	d = matmul(m0, m1)
#   The order of error codes (checked from top to bottom):
#   If the dimensions of m0 do not make sense, 
#   this function exits with exit code 2.
#   If the dimensions of m1 do not make sense, 
#   this function exits with exit code 3.
#   If the dimensions don't match, 
#   this function exits with exit code 4.
# Arguments:
# 	a0 (int*)  is the pointer to the start of m0 
#	a1 (int)   is the # of rows (height) of m0
#	a2 (int)   is the # of columns (width) of m0
#	a3 (int*)  is the pointer to the start of m1
# 	a4 (int)   is the # of rows (height) of m1
#	a5 (int)   is the # of columns (width) of m1
#	a6 (int*)  is the pointer to the the start of d
# Returns:
#	None (void), sets d = matmul(m0, m1)
# =======================================================
matmul:

    # Error checks
    addi t0, x0, 1
    blt a1, t0, exit_2
    blt a2, t0, exit_2
    blt a4, t0, exit_3
    blt a5, t0, exit_3
    bne a2, a4, exit_4

    # Prologue
    addi sp, sp, -4
    sw ra, 0(sp)
    li t0, 0
    li t1, 0
    li t2, 4
    li t5, 0
    

outer_loop_start:
    li t6, 0
    bge t0, a1, outer_loop_end


inner_loop_start:
    bge t1, a2, inner_loop_end
    mul t2, t0, a2
    add t2, t2, t1
    add t3, x0, t2
    li t2, 4
    mul t3, t3, t2 # offset of the left matrix
    add t3, a0, t3 # address of the left address
    lw t4, 0(t3) # value of left row
    mul t3, t1, a5
    add t3, t3, t6
    mul t3, t3, t2 # offset of the right matrix
    add t3, t3, a3 # address of the right martix
    lw t3, 0(t3) # value of right column
    mul t4, t4, t3 
    add t5, t4, t5 # value of row t0 * col t1
    addi t1, t1, 1
    j inner_loop_start

inner_loop_end:
    li t1, 0
    mul t2, t0, a5
    add t2, t2, t6
    slli t2, t2, 2
    add t2, t2, a6
    sw t5, 0(t2) # store value in matrix
    li t5, 0
    li t2, 4
    addi t6, t6, 1
    bge t6, a5, inter
    j inner_loop_start

inter:
    addi t0, t0, 1
    j outer_loop_start

outer_loop_end:
    # Epilogue
    lw ra, 0(sp)
    addi sp, sp, 4
    
    ret

exit_2:
    addi a0, x0, 17
    addi a1, x0, 2
    ecall

exit_3:
    addi a0, x0, 17
    addi a1, x0, 3
    ecall

exit_4:
    addi a0, x0, 17
    addi a1, x0, 4
    ecall