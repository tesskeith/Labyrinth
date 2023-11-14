#ifndef FIGHT3_H
#define FIGHT3_H

#include "gba.h"
#include "game.h"

#define SKELETONCOUNT 3
#define SMAPWIDTH 256
#define SMAPHEIGHT 512

void initFight3();
void updateFight3();
void drawFight3();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkSkeletonCollision();
void exitFight3();


extern SPRITE skeletons[SKELETONCOUNT];

#endif