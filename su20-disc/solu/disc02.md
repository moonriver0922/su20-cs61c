1

1.1 true

1.2 ~~i don't know~~

As we like to say, "everything is just bits." A pointer is just a sequence of bits,
interpreted as a memory address. An array acts like a pointer to the rst element in
the allocated memory for that array. However, an array name is not a variable, that
is, arr = arr whereas ptr != ptr unless some magic happens (what does that mean?).

1.3 ~~i don't know~~	

It will treat that variable's underlying bits as if they were a pointer and attempt to
access the data there. C will allow you to do almost anything you want, though if
you attempt to access an "illegal" memory address, it will segfault for reasons we
will learn later in the course. It's why C is not considered "memory safe": you can
shoot yourself in the foot if you're not careful. If you free a variable that either has
been freed before or was not malloced/calloced/realloced, bad things happen. The
behavior is undened and terminates execution, resulting in an "invalid free" error.

1.4 ~~memory management	yep~~

If you need to keep access to data over several function calls, use the heap. If you're
dealing with a large piece of data, passing around a pointer to something on the heap
is more ecient and a better practice than passing around the data itself. (Think:
carrying a library around vs knowing the address TO the library). Heaps grow up
and stacks grow down, meeting when working memory is full.

2

2.1 ~~0xF9320900	0xF9320904~~	0x2A

pp evaluates to 0xF9320904. *pp evaluates to 0xF93209AC. **pp evaluates to 0x2A.

2.2 (a)calculate the sum value of the array

​	  (b)~~two's complements of number of zero in the array~~

Returns -1 times the number of zeroes in the rst N elements of arr.

​	  (c)swap(x，y)

​	  (d)在异或结果后再取反	x == y

3

3.1

(a) 

```c
void swap(int *x, int *y) {
    int temp = *x;
    *x = *y;
    *y = temp;
}
```

(b)

```c
int mystrlen(char* str) {
   int count = 0;
    while (*str++) {
        count++;
    }
    return count;
}
```

3.2

(a)

~~summands换成指针传进函数~~

It is necessary to pass a size alongside the pointer.

(b)

```c
if (*(string + i) == '\0')
    return;
```

(c)

~~i don't know~~ no errors

(d)

~~i don't know~~ char *srcptr, replaceptr initializes a char pointer, and a char|not two char pointers.
The correct initialization should be, char *srcptr, *replaceptr.

4

4.1

(a) static

(b) stack

(c) ~~heap~~ static

(d) ~~static~~ Code, static, or stack
Constants can be compiled directly into the code. x = x + 1 can compile with
the number 1 stored directly in the machine instruction in the code. That
instruction will always increment the value of the variable x by 1, so it can be
stored directly in the machine instruction without reference to other memory.
This can also occur with pre-processor macros.

Constants can also be found in the stack or static storage depending on if it's
declared in a function or not.

![image-20220413140255530](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220413140255530.png)

(e) code

(f) heap

(g) static

![image-20220413140411175](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220413140411175.png)

4.2

(a) 

```c
calloc(k, sizeof(int))
```

(b)

```c
malloc((p+1) * sizeof(character))
```

(c)

```c
calloc(n * m, sizeof(int))
```

4.3

copy the first of 10 chars of the buffer

If the user input contains more than 63 characters, then the input will override other
parts of the memory! (You will learn more about this and how it can be used to
maliciously exploit programs in CS 161.)
Note that it's perfectly acceptable in C to create an array on the stack. It's often
discouraged (mostly because people often forget the array was initialized on the
stack and accidentally return a pointer to it), but it's not an issue itself.

4.4

```c
void prepend(struct ll_node** lst, int value) {
    struct ll_node new;
    new.rest = **lst;
    new.first = value;
}
```

![image-20220413141237648](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220413141237648.png)

4.5

```c
void free_ll(struct ll_node** lst) {
    free(**lst.first);
    if(**lst.rest == null) {
        free(**lst);
        return;
    }
    free_ll(**lst.rest)
}
```

![image-20220413141259058](C:\Users\Guosheng_W\AppData\Roaming\Typora\typora-user-images\image-20220413141259058.png)