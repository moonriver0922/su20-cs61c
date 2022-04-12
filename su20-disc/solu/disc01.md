# disc0

------

## 1.1

true

## 1.2

false

## 1.3

false

## 1.4

true

## 2.1

### 	(a)

#### 	1.

​	decimal: 147	hex:0x93

#### 	2.

​	binary: 111111	~~hex:0x4f~~  0x3f

#### 	3.

​	decimal: 36	hex: 0x24

#### 	4.

​	binary: 0b0	hex: 0x0

#### 	5.

​	binary: 100111	hex: 0x27

#### 	6.

​	binary: 110110101	hex: 0x1b5

#### 	7.

​	binary:0b100100011 	decimal: 291

### 	(b)

#### 	1.

​	0b1101 0011 1010 1101

#### 	2.

​	0b1011 0011 0011 1111

#### 	3.

​	0b0111 1110 1100 0100

### 	(c)

​	64Ki	128Mi	8Ti	64Gi

​	16Gi	2Ei	128Ti	512Pi

### 	(d)

​	2^11	2^19	2^24

​	~~2^57~~  2^58	2^36	2^67

## 3

### 	(a)

#### 	1.

​	255  0

#### 	2.

​	~~0~~  128  -127

#### 	3.

​	~~63~~  127  -128

### 	(b)

#### 	1.

​	0000 0000	0000 0001	?

#### 	2.

​	~~1111 1111~~	0111 1111	~~?~~  1000 0000	~~1111 1110~~  1111 1110

#### 	3.

​	0000 0000	0000 0001	1111 1111

### 	(c)

#### 	1.

​	0001 0001	?

#### 	2.

​	~~?~~  1001 0000	~~0011 1110~~  0110 1110

#### 	3.

​	0001 0001	~~1000 1111~~  1110 1111

### 	(d)

​	~~255~~  There is no such integer. For example, an arbitrary 8-bit mapping could choose 	to represent the numbers from 1 to 256 instead of 0 to 255.

### 	(e)

​	<img src="C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220412140155149.png" alt="image-20220412140155149" style="zoom:50%;" />

### 	(f)

​	it's up to you

## 4

### 	(a)

#### 	1.

​	~~16~~  18

#### 	2.

​	29, overflow

#### 	3.

​	~~65~~  Converting to binary, we get 0b111011 + 0b000110 = (after truncating) 0b000001 	= 1. Despite the extra truncated bit, this is not an overflow as -5 + 6 indeed equals 1!

#### 	4.

​	~~85~~  Trick question! This is not possible, as these hex numbers would need 8 bits to 	represent and we are working with 6 bit numbers.

### 	(b)

#### 	1.

​	~~3~~  In general n bits can be used to represent at most 2n distinct things. As such 8     	bits can represent 28 = 256 numbers. However, this range actually contains 257 	   	numbers so we need 9 bits.

#### 	2.

​	6

#### 	3.

​	7

#### 	4.

​	44