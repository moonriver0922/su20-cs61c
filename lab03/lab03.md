# lab03

------

### 写在前面：

​	    lab难度一般，学会了Venus的一些使用方法，在vscode上也配置了risc-v的环境.

### 重点:

​		深化了对一些指令的掌握。比如在factorial.s里面的lw指令，要知道是load地址值指向的区域的值，不是load地址值，还有jr、jal、jalr对于ra的处理。

### 难点：

​		对于ecall的理解，一开始以为就是一个调用指令，但是在看map.c的create_default_list的时候怎么都看不懂怎么生成的链表，后来查了一下才发现ecall指令类似于中断,syscall这种，不同值有不同的功能。这个点理解了exercise4基本也就没有难度了。