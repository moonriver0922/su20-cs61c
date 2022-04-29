.globl read_matrix

.text
# ==============================================================================
# FUNCTION: Allocates memory and reads in a binary file as a matrix of integers
#   If any file operation fails or doesn't read the proper number of bytes,
#   exit the program with exit code 1.
# FILE FORMAT:
#   The first 8 bytes are two 4 byte ints representing the # of rows and columns
#   in the matrix. Every 4 bytes afterwards is an element of the matrix in
#   row-major order.
# Arguments:
#   a0 (char*) is the pointer to string representing the filename
#   a1 (int*)  is a pointer to an integer, we will set it to the number of rows
#   a2 (int*)  is a pointer to an integer, we will set it to the number of columns
# Returns:
#   a0 (int*)  is the pointer to the matrix in memory
#
# If you receive an fopen error or eof, 
# this function exits with error code 50.
# If you receive an fread error or eof,
# this function exits with error code 51.
# If you receive an fclose error or eof,
# this function exits with error code 52.
# ==============================================================================
read_matrix:

    # Prologue
    addi sp, sp, -40
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw s4, 16(sp)
    sw s5, 20(sp)
    sw s6, 24(sp)
    sw s7, 28(sp)
    sw s8, 32(sp)
    sw ra, 36(sp)
	 
    mv s0, a0 # filename
    mv s1, a1 # row length
    mv s2, a2 # column length

    # fopen
    mv a1 s0
    li a2 0
    jal fopen
    li t0 -1
    beq a0 t0 exit_50
    mv s3 a0 # file descriptor

    li s4 4

    # read row length
    mv a1 s3
    mv a2 s1
    mv a3 s4
    jal fread
    bne a0 s4 exit_51

    # read column length
    mv a1 s3
    mv a2 s2
    mv a3 s4
    jal fread
    bne a0 s4 exit_51

    lw s5 0(s1) # row length
    lw s6 0(s2) # column length

    # malloc memory for matrix
    mul s7 s5 s6
    mul s7 s7 s4
    mv a0 s7
    jal malloc
    mv s8 a0 # address of the matrix in memory

    # read to the matrix
    mv a1 s3
    mv a2 s8
    mv a3 s7
    jal fread
    bne a0 s7 exit_51

    # close
    mv a1 s3
    jal fclose
    bne a0 x0 exit_52

    # Epilogue
    mv a0 s8
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw s4, 16(sp)
    lw s5, 20(sp)
    lw s6, 24(sp)
    lw s7, 28(sp)
    lw s8, 32(sp)
    lw ra, 36(sp)
    addi sp sp 40
    

    ret

exit_50:
    li a0, 17
    li a1, 50
    ecall

exit_51:
    li a0, 17
    li a1, 51
    ecall

exit_52:
    li a0, 17
    li a1, 52
    ecall