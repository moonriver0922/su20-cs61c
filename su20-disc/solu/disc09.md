# 1

1.1	true

1.2	~~true~~	False. When the cache is full, you can still get compulsory misses (when a block of data is put in the cache for the first time) and conflict misses (if a fully associative cache with LRU replacement wouldn't have missed).

1.3	~~true~~	False. Whether this improves the hit rate for a given program depends on the characteristics of the program. As an example, it is possible for a program that only consists of a loop that runs through an array once to have each access be separated by more than one block (say, the block size is 8B, but we have an integer array and accessing every fourth element, so our access are separated by 16B). This makes every miss a compulsory miss, and there is no way for us to reduce the number of compulsory misses just by adding more blocks to our cache.

# 2

2.1	3th,4th

2.2	27	0,1,2

2.3	

# 3

3.1

3.2	1/3

# 4



# 5

5.1	~~28~~	20

5.2	~~14~~	6	4	10

5.3	~~75%~~

![image-20220531214707164](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220531214707164.png)

5.4	~~100%~~

![image-20220531214854787](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220531214854787.png)