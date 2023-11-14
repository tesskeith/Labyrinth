# 1 "fight2.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fight2.c"
# 1 "fight2.h" 1



# 1 "gba.h" 1






typedef signed char s8;
typedef unsigned char u8;
typedef signed short s16;
typedef unsigned short u16;
typedef signed int s32;
typedef unsigned int u32;
typedef signed long long s64;
typedef unsigned long long u64;


typedef void (*ihp)(void);






extern volatile unsigned short *videoBuffer;
# 44 "gba.h"
void waitForVBlank();
# 64 "gba.h"
int collision(int x1, int y1, int width1, int height1, int x2, int y2, int width2, int height2);
# 80 "gba.h"
extern unsigned short oldButtons;
extern unsigned short buttons;




typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;
extern DMA *dma;
# 112 "gba.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 164 "gba.h"
# 1 "mode0.h" 1



# 1 "gba.h" 1
# 5 "mode0.h" 2
# 32 "mode0.h"
typedef struct { u16 tileData[16]; } TILE;
typedef TILE charblock[512];



typedef struct {
 u16 tilemap[1024];
} screenblock;
# 165 "gba.h" 2
# 1 "sprites.h" 1
# 10 "sprites.h"
typedef struct {
  u16 attr0;
  u16 attr1;
  u16 attr2;
  u16 fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 63 "sprites.h"
void hideSprites();


typedef struct {
    int x;
    int y;
    int fightx;
    int fighty;
    int dx;
    int dy;
    int width;
    int height;
    int direction;
    int isMoving;
    int timeUntilNextFrame;
    int frame;
    int numOfFrames;
    int active;
    int hide;
    int health;
    int cheat;
} SPRITE;
# 166 "gba.h" 2
# 5 "fight2.h" 2
# 1 "game.h" 1
# 13 "game.h"
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

extern SPRITE arrows[5];

extern SPRITE harpies[5];

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


extern int minute;
extern int second;
# 6 "fight2.h" 2
# 21 "fight2.h"
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
# 2 "fight2.c" 2
# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 3 "fight2.c" 2
# 1 "sound.h" 1



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void pauseSounds();
void unpauseSounds();
void stopSounds();



typedef struct {

    unsigned int sampleRate;
    unsigned int length;
    signed char* data;

} SONG;

SONG songs[2];

void initSongs();
void playSong(int);
extern int currTheme;
# 65 "sound.h"
typedef struct{
    const signed char* data;
    int dataLength;
    int isPlaying;
    int looping;
    int durationInVBlanks;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 4 "fight2.c" 2




int collisionsEnabled;
int passed2;
int jump;

SPRITE player;
SPRITE minotaur;

enum {DOWN, UP, RIGHT, LEFT} DIRECTION;

void initFight2() {
    newArrow =0;
    jump = 0;
    collisionsEnabled = 0;
    fightingMinotaur = 1;

    player.fightx = 0;
    player.fighty = 35;



    player.direction = RIGHT;

    initMinotaur();

}
void drawFight2() {


    drawPlayerFightingMinotaur();
    drawMinotaur();
    drawArrows();
    drawHealth();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

}

void drawPlayerFightingMinotaur() {
    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);

    } else {


        shadowOAM[0].attr0 = ((((player.fighty) >> 8)) & 0xFF) | (0<<14);
        shadowOAM[0].attr1 = ((player.fightx) & 0x1FF) | (2<<14);


        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((5*player.direction) * 32 + (5)) & 0x3FF);

    }
}

void updateFight2() {
    if ((~(buttons) & ((1<<8)))){
        shootArrow(0);
        newArrow++;

    }

    if((!(~(oldButtons) & ((1<<9))) && (~(buttons) & ((1<<9))))) {
       shootArrow(1);
       newArrow++;
    }
     for(int i = 0; i < 5; i++) {
        if(arrows[i].cheat) {
            animateEnemy(&arrows[i]);
        }
    }
    moveArrows();
    checkArrowCollision(&minotaur);
    movePlayerF2();
    moveMinotaur();

    animateEnemy(&minotaur);
    updateHealth();
    checkCollision2();

    if (player.health == 0) {
        goToLose();
    }
}

void initMinotaur() {
    minotaur.x = 170;
    minotaur.y = 110;
    minotaur.dx = 1;
    minotaur.dy = 1;
    minotaur.width = 64;
    minotaur.height = 56;
    minotaur.direction = LEFT;
    minotaur.timeUntilNextFrame= 10;
    minotaur.isMoving = 1;
    minotaur.frame = 0;
    minotaur.numOfFrames = 3;
    minotaur.health = 140;
    minotaur.hide = 0;
}

void drawMinotaur() {
        if (minotaur.hide) {
            shadowOAM[6].attr0 |= (2<<8);
        } else {

            shadowOAM[6].attr0 = ((minotaur.y) & 0xFF) | (0<<14);
            shadowOAM[6].attr1 = ((minotaur.x) & 0x1FF) | (3<<14);


            shadowOAM[6].attr2 = (((0) & 0xF) << 12) | (((8*minotaur.frame) * 32 + (8*minotaur.direction)) & 0x3FF);

    }
}



void checkCollision2() {


    if(!minotaur.hide) {
        if(collision(player.fightx, ((player.fighty) >> 8), player.width, player.height, minotaur.x + 10,minotaur.y + 10,minotaur.width - 20,minotaur.height - 20)) {
            player.health-= 10;
            playSoundB(collide_data,collide_length,0);
            if(player.fightx < 120){
                minotaur.x = 170;
            } else {
                minotaur.x = 0;
            }

        }

    }
}

void movePlayerF2() {



    int canJump = 0;


    jump += 40;



    if (((player.fighty +jump) >> 8) > (160 - 35)) {
       jump = 0;
        canJump = 1;
    }


    player.fighty +=jump;

    if ((!(~(oldButtons) & ((1<<6))) && (~(buttons) & ((1<<6)))) && canJump) {

       jump -= 1300;

    }

    if ((~(buttons) & ((1<<5)))
        && player.fightx > 0 ) {

            player.fightx -= player.dx;
            player.direction = LEFT;
        }

    if ((~(buttons) & ((1<<4)))
        && player.fightx + player.width < 240) {
            player.fightx += player.dx;
            player.direction = RIGHT;
        }

}

void moveMinotaur() {

    if ((minotaur.x < 0) || (minotaur.x > 240 - minotaur.width )) minotaur.dx *=-1;
        minotaur.x += minotaur.dx;

        if(minotaur.dx > 1) {
            minotaur.direction = RIGHT;
        } else{
            minotaur.direction = LEFT;
        }
}



void exitFight2() {
        for(int i = 0; i < 5; i++) {
            arrows[i].hide = 1;
        }
        minotaur.hide = 1;
        passed2 = 1;
        mapState = 1;
        ((u16 *)0x5000200)[2] = (((9) & 31) | ((18) & 31) << 5 | ((23) & 31) << 10);
        ((u16 *)0x5000200)[8] = (((4) & 31) | ((5) & 31) << 5 | ((11) & 31) << 10);
        fightingMinotaur = 0;
        collisionsEnabled = 1;
        goToGame();
}
