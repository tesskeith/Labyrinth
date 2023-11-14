#ifndef LIST_H
#define LIST_H

typedef struct screen {
	// const unsigned short* tilemap;
	// const unsigned int* tileMapLen;
	// const unsigned short* tiles;
	// const unsigned short* tileSize;
	// const unsigned short* pal;
	const unsigned short* bitmap;

} SCREEN;

// Struct for a node for a doubly-linked list
typedef struct dlnode {
	struct dlnode* prev;
	struct dlnode* next;
	SCREEN screen;
} NODE;

// Struct for a doubly-linked list
typedef struct dllist {
	struct dlnode *head;
	struct dlnode *tail;
} LIST;


// ---- Prototypes ----
LIST* createList();
void pushBack(LIST *dllist, SCREEN screen);

#endif
