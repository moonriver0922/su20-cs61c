# proj2 

------

### 总结：

​		总的来说是很好的一个proj，分为partA和partB两部分，对于call convention确实有很大的理解，在自己分配的时候要考虑到t0...、a0...、s0...这三类寄存器的分配，前面的task循序渐进，难度都还好，最后的classify难度还是有的，要考虑到在stack上分配内存空间，合理存储矩阵的row length 和 column length等属性。

​		不过一直到最后做到验证结果、图像生成时才真正明白这个proj是干嘛的，说实话，一开始没搞懂它数字的对应关系，又回去看了一下overview才明白，算是初次接触到了神经网络，感觉很神奇！

​		最后，自己画图的时候要注意尺寸28 x 28，一开始画的太大结果一直是0

------

### 遭遇的问题：

未重载a1、a5

![image-20220429210924694](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220429210924694.png)

<img src="C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220429210810200.png" alt="image-20220429210810200" style="zoom: 200%;" />

重载a1、a5

![image-20220429211000678](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220429211000678.png)

<img src="C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220429210846211.png" alt="image-20220429210846211" style="zoom: 200%;" />

label文件夹中出错的两个（9个input我都生成出来看了一下，发现有的比它俩还离谱一样能识别正确）

label2:9

label7:8

------

### 收获

​		锻炼了risc-v的编写能力，更多的是一种对于规则的遵守能力，还有调试能力等等...