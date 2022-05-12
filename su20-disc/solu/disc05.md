# 1

1.1 true

1.2 ~~true~~  False. That's the job of the compiler. The assembler is primarily  responsible for replacing pseudoinstructions and resolving osets.

1.3 false

1.4 false False. Jumps relative to registers (i.e. from jalr instructions) are only known at run-time. Otherwise, you would not be able to call a function from dierent call
sites.

# 2

2.1 It is the idea that instructions are really just data, so we can treat them as such.
This enables us to write programs that can manipulate other programs without
modifying the physical hardware!

2.2 two passes, because forward reference

2.3 ~~.text .data .word .asilic~~

![image-20220510164639251](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220510164639251.png)

2.4 assembler	linker

# 3

3.1 line 5,6,7,<u>14</u>,15

3.2 ~~loop	print_int~~

Note: This answer assumes that the assembler goes from top to bottom. The
answer changes if it goes in reverse.
loop (in j loop) will be resolved in the rst pass since it's a backward reference.
Since the assembler will have kept note of where end is in the rst pass, it will resolve
end in blt t1, x0, end in the second pass. (print_int in jal ra, print_int will
be resolved by the Linker.)

3.3 ~~sum	loop	end	array~~

![image-20220510165102314](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220510165102314.png)

3.4 ~~print_int~~

![image-20220510165314998](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220510165314998.png)

# 4

4.1 ~~0xfffffe00~~

![image-20220510165600068](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220510165600068.png)

4.2 ~~0x000000ff~~

![image-20220510165659926](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220510165659926.png)

4.3 

![image-20220510170312131](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220510170312131.png)