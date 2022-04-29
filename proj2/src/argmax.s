.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
#
# If the length of the vector is less than 1, 
# this function exits with error code 7.
# =================================================================
argmax:

    # Prologue
    addi sp, sp, -4 # sp = sp + -4
    sw ra, 0(sp)

    addi t0, x0, 1 # t0 = x0 + 1
    blt a1, t0, exit_7 # if a1 < t0 then exit_7
    
    li t1, 0 # index of the array
    li t2, 0 # offset address of the array
    li t3, 0 # the largest element
    li t4, 0 # index of the largest element
loop_start:
    beq t1, a1, loop_end # if t1 == a1 then loop_end
    add t5, a0, t2
    lw t0, 0(t5) # the value of current element
    blt t3, t0, max # if t5 < t0 then max
    j loop_continue  # jump to loop_continue
    
    
max:
    add t3, x0, t0
    add t4, x0, t1

loop_continue:
    addi t1, t1, 1 # t1 = t1 + 1
    addi t2, t2, 4 # t2 = t2 + 4
    j loop_start  # jump to loop_start
    
    
loop_end:
    # Epilogue
    lw ra, 0(sp)
    addi sp, sp, 4 # sp = sp + 4
    add a0, x0, t4 # a0 = x0 + t4
    
    ret

exit_7:
    addi a0, x0, 17
    addi a1, x0, 7
    ecall