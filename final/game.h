#ifndef GAME_H
#define GAME_H

#include "gba.h"

#define ARROWCOUNT 5
#define HARPYCOUNT 5
#define MAPWIDTH 512
#define MAPHEIGHT 512



void initGame();
void updateGame();
void drawGame();
void initPlayer();
void movePlayer();
void animatePlayer(SPRITE *sprite);
void drawPlayer();
void drawHealth();
void updateHealth();
void drawArrows();
void moveArrows();
int canMoveLeft(SPRITE *sprite, int x, int y);
int canMoveRight(SPRITE *sprite, int x, int y);
int canMoveUp(SPRITE *sprite, int x, int y);
int canMoveDown(SPRITE *sprite, int x, int y);
void shootArrow(int cheat);

void checkArrowCollision(SPRITE *sprite);
int newArrow;

extern SPRITE arrows[ARROWCOUNT];

extern SPRITE harpies[HARPYCOUNT];

extern unsigned char* collisionMap;

extern int mapState;
extern int fightingharpies;
extern int fightingMinotaur;
extern int fightingSkeletons;
extern int collisionsEnabled;
extern int passed1;
extern int passed2;
extern int passed3;

extern int hOff;
extern int vOff;

extern int health;
extern int healthCountdown;
extern int cheat;

//sound 
extern int minute;
extern int second;

#endif