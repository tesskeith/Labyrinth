#ifndef FIGHT2_H
#define FIGHT2_H

#include "gba.h"
#include "game.h"



#define FLOORHEIGHT 35

// defines gravity strength and player jump strength
#define GRAVITY 40 // the smaller the value, the more "whimsical" the player will look
#define JUMPVELOCITY 1300 // the larger the value, the greater the player's initial velocity

// TODO: use the shift macros!
//shift macros
#define SHIFTUP(num) ((num) << 8) // results in larger value
#define SHIFTDOWN(num) ((num) >> 8) // results in smaller value


void initFight2();
void updateFight2();
void drawFight2();
void initMinotaur();
void moveMinotaur();
void drawMinotaur();
void checkCollision2();
void drawPlayerFightingMinotaur();

void movePlayerF2();
void animateEnemy(SPRITE *sprite);
void exitFight2();



#endif