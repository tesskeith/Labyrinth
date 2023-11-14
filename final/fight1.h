#ifndef FIGHT1_H
#define FIGHT1_H

#include "gba.h"
#include "game.h"

#define HARPYCOUNT 5
#define HMAPWIDTH 256
#define HMAPHEIGHT 256

void initFight1();
void updateFight1();
void drawFight1();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkCollision();
void exitFight1();


extern SPRITE harpies[HARPYCOUNT];

#endif