## 1

1.1 ~~true~~

False. a0 and a1 registers are often used to store the return value from a function,
so the function can set their values to the its return values before returning.

1.2 false

1.3 true

1.4 ~~false~~

True. There is no fundamental dierence between integers, strings, and memory
addresses in RISC-V (they're all bags of bits), so it's possible to manipulate data in
this way. (We don't recommend it, though).

1.5 false

1.6 false

## 2

2.1 yes i can

## 3

3.1 add s0, x0, a1	or s2, ra, t5

## 4

a) ~~load 4 into t0~~ Sets t0 equal to arr[3]

b) modify 3 into 4

b) t0 shift left two bits......

c) ~~?~~ Sets t0 to -1 * arr[0]

## 5

addi s0, x0, 4

addi s1, x0, 5

addi s2, x0, 6

add t0, s0, s1

add s3, t0, s2

addi s3, s3, 10

------

sw x0, 0(s0)

addi s1, x0, 2

sw s1, 4(s0)

~~lw s1, s1(s0)~~

slli t0, s1, 2
add t0, t0, s0
sw s1, 0(t0)

------

addi s0, x0, 5

addi s1, x0, 10

add t0. s0, s0

bne t0, s1, else

addi s0, x0, 0

jmp next

else:

​	subi s1, s0, 1

next:

------

```c
//s0 -> a, s1 -> b
int a = 0, b = 1;
int tmp = 30;
while (a != 30) {
    b *= 2;
    a += 1;
}
```

------

addi s0, x0, n

addi s1, x0, 0

loop:

​	beq s0, x0, exit

​	add s1, s1, s0

​	sub s0, s0, 1

​	jal x0, loop

exit:

------

## 6

6.1	arr[1] = 7

6.2	let all list->val plus 1 until it is null

6.3	?

Negates all elements in arr

## 7

7.1	a0-a7

7.2	a0-a1

7.3	stack pointer	store some registers

sp stands for stack pointer, and it represents the boundary between stored data and
free space on the stack. Because the stack grows downward, we subtract from sp
to create more space (moving the stack pointer down), and add to sp to free space
(moving the stack pointer back up). The stack is mainly used to save (and later
restore) the value of registers that may be overwritten.

7.4	volatile registers

7.5	saved registers

7.6	saved registers	volatile registers

## 8

8.1	s0	a0	a1

​	add s0, a0, x0 	# Set s0 equal to the parameter n
​	add s1, x0, x0 	# Set s1 (accumulator) equal to 0
loop: beq s0, x0, end 	# Branch if s0 reaches 0
​	add a0, s0, x0 	# Set a0 to the value in s0, setting up args for call to function square
​	jal ra, square 	# Call the function square
​	add s1, s1, a0 	# Add the returned value into s1
​	addi s0, s0, -1 	# Decrement s0 by 1
​	jal x0, loop 	# Jump back to the loop label
end: add a0, s1, x0 	# Set a0 to s1 (desired return value)

8.2

prologue: addi sp, sp -12 	# Make space for 3 words on the stack
	sw ra, 0(sp) 	# Store the return address
	sw s0, 4(sp) 	# Store register s0
	sw s1, 8(sp)	# Store register s1
epilogue: lw ra, 0(sp) # Restore ra
	lw s0, 4(sp) 	# Restore s0
	lw s1, 8(sp) 	# Restore s1
	addi sp, sp, 12 	# Free space on the stack for the 3 words
	jr ra 	# Return to the caller

### ~~prologue~~

​	~~addi sp, sp, -4~~

​	~~sw ra, 0(sp)~~

​	~~call sumSquare~~

### ~~epilogue~~

​	~~lw ra, 0(sp)~~

​	~~addi sp, sp, 4~~

​	~~jr ra~~

## 9

9.1

```c
int result = 1;
while (y != 0) {
    result *= x;
    y -= 1;
}
x = result;

// Function computes pow(x,y)
// Direct translation:
int power(int x, int y) {
int result = 1;
while (y != 0) {
result *= x;
y--;
}
return result;
}
```









