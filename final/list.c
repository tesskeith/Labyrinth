#include <stdlib.h>
#include <stdio.h>
#include <limits.h>
#include "list.h"
#include "print.h"

static NODE* createNode(SCREEN screen);

// Creates a list by allocating memory for it on the heap
// Be sure to initialize head and tail to NULL and return a pointer to the list!
LIST* createList(void) {
    // Activity 1.0: Complete this function
    LIST* list = malloc(sizeof(list));
    if(list == NULL) {
        return NULL;
    } else {
        list->head = NULL;
        list->tail = NULL;
    }
    return list;
}

// Helper function that creates a node by allocating memory for it on the heap
// Be sure to set its pointers to NULL and to set the data to the passed in position!
static NODE* createNode(SCREEN screen ) {
    // Activity 1.1: Complete this function
    NODE* node = malloc(sizeof(NODE));
    if (node == NULL) {
        return NULL;
    } else {
        node->screen = screen;
        node->next = NULL;
        node->prev = NULL;
    }
    return node;
}

// Adds the data to the end of the linked list
void pushBack(LIST *dllist, SCREEN screen) {
    // Activity 1.2: Complete this function
    NODE* node = createNode(screen);
    if (dllist->head == NULL) {
        dllist->head = node;
    } else {
        dllist->tail->next = node;
        node->prev = dllist->tail;
    }
    dllist->tail = node;
}
