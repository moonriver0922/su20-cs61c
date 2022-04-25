.globl factorial

.data
n: .word 8

.text
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    lw a2, 0(t0)
    addi a3, x0, 1
    beq a2, a3, exit # if a2 == x0 then exit
    addi a1, a2, -1
    mul a0, a0, a1
    addi a2, a2, -1
    sw a2, 0(t0)
    j factorial  # jump to factorial
    
exit:
    jr ra   # jump to ra