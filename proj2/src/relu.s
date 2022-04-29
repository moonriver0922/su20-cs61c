.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
#
# If the length of the vector is less than 1, 
# this function exits with error code 8.
# ==============================================================================
relu:
    # Prologue
    addi sp, sp, -4
    sw ra, 0(sp)

    addi t0, x0, 1
    blt a1, t0, exit_8

    addi t1, x0, 0 # offset address of the array
    addi t2, x0, 0 # index of the array
    
loop_start:
    beq t2, a1, loop_end 
    add t0, a0, t1
    lw t3, 0(t0)
    bge t3, x0, loop_continue
    sw x0, 0(t0)
    
loop_continue:
    addi t1, t1, 4
    addi t2, t2, 1
    j loop_start


loop_end:
    # Epilogue
    lw ra, 0(sp)
    addi sp, sp, 4
    
	ret

exit_8:
    addi a0, x0, 17
    addi a1, x0, 8
    ecall
