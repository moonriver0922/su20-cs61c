.import ../../src/read_matrix.s
.import ../../src/utils.s

.data
file_path: .asciiz "inputs/test_read_matrix/test_input.bin"
row: .word 0
col: .word 0

.text
main:

    # Prologue
    addi sp sp -12
    sw s0 0(sp)
    sw s1 4(sp)
    sw s2 8(sp)

    la s0 file_path
    la s1 row
    la s2 col

    # Read matrix into memory
    mv a0 s0
    mv a1 s1
    mv a2 s2
    jal read_matrix


    # Print out elements of matrix
    lw a1 0(s1)
    lw a2 0(s2)
    jal print_int_array
    jal free

    #Epilogue
    lw s0 0(sp)
    lw s1 4(sp)
    lw s2 8(sp)
    addi sp sp 12


    # Terminate the program
    jal exit