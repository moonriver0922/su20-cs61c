.globl classify

.text
classify:
    # =====================================
    # COMMAND LINE ARGUMENTS
    # =====================================
    # Args:
    #   a0 (int)    argc
    #   a1 (char**) argv
    #   a2 (int)    print_classification, if this is zero, 
    #               you should print the classification. Otherwise,
    #               this function should not print ANYTHING.
    # Returns:
    #   a0 (int)    Classification
    # 
    # If there are an incorrect number of command line args,
    # this function returns with exit code 49.
    #
    # Usage:
    #   main.s -m -1 <M0_PATH> <M1_PATH> <INPUT_PATH> <OUTPUT_PATH>
    
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

    li t0 4
    blt a0 t0 exit_49




	# =====================================
    # LOAD MATRICES
    # =====================================
    mv s0 a0
    mv s1 a1
    mv s2 a2




    # Load pretrained m0
    lw a0 4(s1)
    addi sp sp -8
    addi a1 sp 0 # address of m0 row length 
    addi a2 sp 4 # address 0f m0 col length
    jal read_matrix
    mv s3 a0 # address of m0





    # Load pretrained m1
    lw a0 8(s1)
    addi sp sp -8
    addi a1 sp 0 # address of m1 row length
    addi a2 sp 4 # address of m1 col length
    jal read_matrix
    mv s4 a0 # address of m1






    # Load input matrix
    lw a0 12(s1)
    addi sp sp -8
    addi a1 sp 0 # address of input row length
    addi a2 sp 4 # address of input col length
    jal read_matrix
    mv s5 a0 # address of input



    # =====================================
    # RUN LAYERS
    # =====================================
    # 1. LINEAR LAYER:    m0 * input
    # 2. NONLINEAR LAYER: ReLU(m0 * input)
    # 3. LINEAR LAYER:    m1 * ReLU(m0 * input)
    
    mv a0 s3
    lw a1 16(sp)
    lw a2 20(sp)
    mv a3 s5
    lw a4 0(sp)
    lw a5 4(sp)

    # allocate memory for m0*input
    mul a0 a1 a5
    mul a0 a0 t0
    jal malloc
    blt a0 x0 exit_48
    mv s6 a0 # address of m0*input

    # 1. LINEAR LAYER:    m0 * input
    mv a0 s3
    mv a6 s6
    jal matmul

    # 2. NONLINEAR LAYER: ReLU(m0 * input)
    mv a0 s6
    mul a1 a1 a5
    jal relu

    # 3. LINEAR LAYER:    m1 * ReLU(m0 * input)
    mv a0 s4
    lw a1 8(sp)
    lw a2 12(sp)
    mv a3 s6
    lw a4 16(sp)
    lw a5 4(sp)

    # allocate memory for m1 * ReLU(m0 * input)
    mul a0 a1 a5
    mul a0 a0 t0
    jal malloc
    blt a0 x0 exit_48
    mv s7 a0 # address of m1 * ReLU(m0 * input)

    mv a0 s4
    mv a6 s7
    jal matmul


    # =====================================
    # WRITE OUTPUT
    # =====================================
    # Write output matrix
    lw a0 16(s1)
    mv a1 s7
    lw a2 8(sp)
    lw a3 4(sp)
    jal write_matrix




    # =====================================
    # CALCULATE CLASSIFICATION/LABEL
    # =====================================
    # Call argmax
    mv a0 s7
    mul a1 a2 a3
    jal argmax



    # Print classification
    mv a1 a0
    jal print_int



    # Print newline afterwards for clarity
    li a1 '\n'
    jal print_char


    #Epilogue
    addi sp sp 24
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

exit_48:
    li a0 17
    li a1 48
    ecall

exit_49:
    li a0 17
    li a1 49
    ecall