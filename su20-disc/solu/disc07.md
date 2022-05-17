# 1

1.1	false

1.2	false

1.3	false

# 2

2.1	a) PC 	IMEM	RegFile	ALU	MEM

​			IM-generate	Branch

​									BrUn	~~Imme-sel~~ B-sel	~~jump~~ A-sel

​			PCsel	RWen	~~IMen~~ ImmSel	BrEq	BrLt	ALU	RW	WB

​		 b)	IF: fetch instruction ID: decode instruction to register file EX: ALU MEM: read from or write to memory WB: which value write back to register or nothing

![image-20220517183049720](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220517183049720.png)

2.2	*	*	0	0	*	0	0	00	read	1	1

​		 same as add

​		 *	*	0	1	*	0	1	00	read	1	2

​		 *	*	0	1	*	0	1	00	write	0	*

​		 1	0	1	0	0/1	0	0	00	read	0	*

​		 *	*	1	0	*	1	0	00	read	1	0

​		same as beq

![image-20220517183542913](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220517183542913.png)

2.3	a)	200	100	200	0	100	600

​				 200	100	200	0	100	600

​			 	200	100	200	200	100	800

​				 200	100	200	200	0	700

​				 200	100	200	0	0	500

​				 200	100	200	0	100	600

​				 200	100	200	0	0	500

​		  b)	lw

​		  c)	800

​		  d)	waste too much time

​		  e)	pipelining	improve performance

![image-20220517183725435](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220517183725435.png)