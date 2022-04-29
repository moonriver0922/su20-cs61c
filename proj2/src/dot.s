.globl dot

.text
# =======================================================
# FUNCTION: Dot product of 2 int vectors
# Arguments:
#   a0 (int*) is the pointer to the start of v0
#   a1 (int*) is the pointer to the start of v1
#   a2 (int)  is the length of the vectors
#   a3 (int)  is the stride of v0
#   a4 (int)  is the stride of v1
# Returns:
#   a0 (int)  is the dot product of v0 and v1
#
# If the length of the vector is less than 1, 
# this function exits with error code 5.
# If the stride of either vector is less than 1,
# this function exits with error code 6.
# =======================================================
dot:
    # Prologue
    addi sp, sp, -4 # sp = sp + -4
    sw ra, 0(sp)

    addi t0, x0, 1 # t0 = x0 + 1
    blt a2, t0, exit_5 # if a2 < t0 then exit_5
    
    blt a3, t0, exit_6 # if a3 < t0 then exit_6
    blt a4, t0, exit_6 # if a4 < t0 then exit_6

    li t0, 0 # index of array
    li t1, 0 # offset address of each array
    li t4, 0 # dot product
    li t5, 4 # 4 bytes per element
    
loop_start:
    mul t1, a3, t0
    bge t1, a2, loop_end
    mul t1, t1, t5
    add t2, t1, a0
    mul t1, a4, t0
    bge t1, a2, loop_end
    mul t1, t1, t5
    add t3, t1, a1
    addi sp, sp, -4
    sw t0, 0(sp)
    lw t0, 0(t2)
    lw t1, 0(t3)
    

multiple:
    mul t0, t0, t1
    add t4, t4, t0
    lw t0, 0(sp)
    addi sp, sp, 4
    addi t0, t0, 1
    j loop_start


loop_end:
    # Epilogue
    lw ra, 0(sp)
    addi sp, sp, 4
    add a0, x0, t4

    ret

exit_5:
    addi a0, x0, 17 # a0 = x0 + 17
    addi a1, x0, 5 # a1 = x0 + 5
    ecall

exit_6:
    addi a0, x0, 17 # a0 = x0 + 17
    addi a1, x0, 6 # a1 = x0 + 6
    ecall
 

    