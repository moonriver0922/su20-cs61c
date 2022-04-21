1

1.1	false

1.2	~~false~~

True. The uneven spacing is due to the exponent representation of oating point
numbers. There are a xed number of bits in the signicand. In IEEE 32 bit storage
there are 23 bits for the signicand, which means the LSB is 2􀀀22 times the MSB.
If the exponent is zero (after allowing for the oset) the dierence between two
neighboring oats will be 2􀀀22. If the exponent is 8, the dierence between two
neighboring oats will be 2􀀀14 because the mantissa is multiplied by 28. Limited
precision makes binary oating-point numbers discontinuous; there are gaps between
them.

1.3	false

2

2.1	~~23~~

2; one "positive" zero and one "negative" zero.

2.2	2^128-2^104

2.3	2^-149

2.4	~~2^-127~~

0x00800000 = 2^-126

2.5	2^-127	0 00000101 00111100100000000000000	0 00000011 00001000000000000000000

​		 ?	?	1 11111111 23个0

![image-20220420134725982](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220420134725982.png)

3

3.1	2 + 2^-22

3.2	4 + 2^-21

3.3	2^-22	2^-21

3.4	2^(-23+y+x**-127**)

Here we need to generalize the solution we got in 1 and 2. However, this is the same
approach just increment the signifcand by the 1.
curr number = 2x^127 + 2x^127 * y
next number = 2x^127 + 2x^127 * y + 2x^127 * 2^23
stepsize = next number - curr number = 2x^150

3.5	2^24 - 1