#include <stddef.h>
#include "ll_cycle.h"

int ll_has_cycle(node *head) {
    /* your code here */
    struct node *tortoise = head;
    struct node *hare = head;
    while (tortoise && hare)
    {
        tortoise = tortoise->next;
        hare = hare->next->next;
        if (tortoise == hare && tortoise)
        {
            return 1;
        }
    }
    return 0;
}