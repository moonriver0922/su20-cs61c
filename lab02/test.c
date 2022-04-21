#include <stdio.h>
int main() {
    char a = 4;
    char* p = NULL;
    p = &a;
    printf("%p\n", p);
    return 0;
}