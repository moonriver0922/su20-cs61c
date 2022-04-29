.globl write_matrix

.text
# ==============================================================================
# FUNCTION: Writes a matrix of integers into a binary file
#   If any file operation fails or doesn't write the proper number of bytes,
#   exit the program with exit code 1.
# FILE FORMAT:
#   The first 8 bytes of the file will be two 4 byte ints representing the
#   numbers of rows and columns respectively. Every 4 bytes thereafter is an
#   element of the matrix in row-major order.
# Arguments:
#   a0 (char*) is the pointer to string representing the filename
#   a1 (int*)  is the pointer to the start of the matrix in memory
#   a2 (int)   is the number of rows in the matrix
#   a3 (int)   is the number of columns in the matrix
# Returns:
#   None
#
# If you receive an fopen error or eof, 
# this function exits with error code 53.
# If you receive an fwrite error or eof,
# this function exits with error code 54.
# If you receive an fclose error or eof,
# this function exits with error code 55.
# ==============================================================================
write_matrix:

    # Prologue
    addi sp sp -40
    sw s0 0(sp)
    sw s1 4(sp)
    sw s2 8(sp)
    sw s3 12(sp)
    sw s4 16(sp)
    sw s5 20(sp)
    sw s6 24(sp)
    sw s7 28(sp)
    sw s8 32(sp)
    sw ra 36(sp)

    mv s0 a0 # filename
    mv s1 a1 # matrix
    mv s2 a2 # row length
    mv s3 a3 # col length

    # fopen
    mv a1 s0
    li t0 1
    mv a2 t0
    jal fopen
    li t0 -1
    beq a0 t0 exit_53
    mv s4 a0 # file descriptor

    # allocate memroy for row & col length
    li t0 4 # 4 bytes a word
    add a0 t0 t0
    jal malloc
    sw s2 0(a0)
    sw s3 4(a0)
    mv s5 a0 # address of memory storeing row & col length

    # write row length and col length
    mv a1 s4
    mv a2 s5
    li t1 2
    mv a3 t1
    mv a4 t0
    jal fwrite
    blt a0 a3 exit_54

    # free memory above
    mv a0 s5
    jal free

    # write matrix
    mv a1 s4
    mv a2 s1
    mul t2 s2 s3
    mv a3 t2
    mv a4 t0
    jal fwrite
    blt a0 a3 exit_54

    # close
    mv a1 s4
    jal fclose
    bne a0 x0 exit_55

    # Epilogue
    lw s0 0(sp)
    lw s1 4(sp)
    lw s2 8(sp)
    lw s3 12(sp)
    lw s4 16(sp)
    lw s5 20(sp)
    lw s6 24(sp)
    lw s7 28(sp)
    lw s8 32(sp)
    lw ra 36(sp)
    addi sp sp 40

    ret

exit_53:
    li a0 17
    li a1 53
    ecall

exit_54:
    li a0 17
    li a1 54
    ecall

exit_55:
    li a0 17
    li a1 55
    ecall
