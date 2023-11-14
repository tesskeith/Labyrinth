# 1 "fight3.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fight3.c"


# 1 "fight3.h" 1



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
# 5 "fight3.h" 2
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
# 6 "fight3.h" 2





void initFight3();
void updateFight3();
void drawFight3();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkSkeletonCollision();
void exitFight3();


extern SPRITE skeletons[3];
# 4 "fight3.c" 2
# 1 "print.h" 1
# 25 "print.h"
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3 4







# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3 4
# 28 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3 4
# 29 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 2 3 4
# 9 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 2 3 4
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4

# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3 4
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 26 "print.h" 2
# 35 "print.h"

# 35 "print.h"
uint8_t mgba_open(void);
void mgba_printf_level(int level, const char* ptr, ...);
void mgba_printf(const char* string, ...);
void mgba_break(void);
void mgba_close(void);
# 5 "fight3.c" 2
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
# 6 "fight3.c" 2
# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 7 "fight3.c" 2
# 1 "fight3collision.h" 1
# 21 "fight3collision.h"
extern const unsigned short fight3collisionBitmap[65536];


extern const unsigned short fight3collisionPal[256];
# 8 "fight3.c" 2

SPRITE skeleton;


int collisionsEnabled;
int passed3;
int hOffSkeleton;
int vOffSkeleton;
int skelcount;
SPRITE player;
SPRITE skeletons[3];

enum {DOWN, UP, RIGHT, LEFT} DIRECTION;

void initFight3() {
    newArrow= 0;
    player.fightx = 0;
    player.fighty = 16;
    fightingSkeletons = 1;
    collisionsEnabled = 1;
    hOffSkeleton = 0;
    vOffSkeleton = 0;
    skelcount = 60;
    collisionMap = (unsigned char*) fight3collisionBitmap;




    initSkeletons();

}
void drawFight3() {


    drawPlayerFightingSkeletons();
    drawSkeletons();
    drawArrows();
    drawHealth();
    (*(volatile unsigned short *)0x04000010) = hOffSkeleton;
    (*(volatile unsigned short *)0x04000012) = vOffSkeleton;
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

}
void updateFight3() {
    if ((~(buttons) & ((1<<8)))){

        shootArrow(0);
        newArrow++;
    }

    if((!(~(oldButtons) & ((1<<9))) && (~(buttons) & ((1<<9))))) {
       shootArrow(1);
       newArrow++;
    }
    moveArrows();
    for(int i = 0; i < 3; i++) {
        checkArrowCollision(&skeletons[i]);
    }
# 79 "fight3.c"
    movePlayerF3();
    moveSkeletons();
    updateHealth();
    animatePlayer(&player);
    for(int i = 0; i < 3; i++) {
        animateEnemy(&skeletons[i]);
    }
    for(int i = 0; i < 5; i++) {
        if(arrows[i].cheat) {
            animateEnemy(&arrows[i]);
        }
    }
    checkSkeletonCollision();

    if (collision(player.fightx,player.fighty,player.width,player.height,220,460,40,40)){
        exitFight3();
    }




}

void exitFight3() {
        passed3 = 1;
        for(int i = 0; i < 3; i++) {
            skeletons[i].hide = 1;
        }
        for(int i = 0; i < 5; i++) {
            arrows[i].hide = 1;
        }
        mapState = 1;
        fightingharpies = 0;
        fightingMinotaur = 0;
        fightingSkeletons = 0;
        collisionsEnabled = 1;
        ((u16 *)0x5000200)[2] = (((9) & 31) | ((18) & 31) << 5 | ((23) & 31) << 10);
        ((u16 *)0x5000200)[8] = (((4) & 31) | ((5) & 31) << 5 | ((11) & 31) << 10);
        goToGame();
}

void initSkeletons() {
    skeletons[0].x = 64;
    skeletons[0].y = 136;
    skeletons[0].dy = -1;
    skeletons[0].direction = DOWN;
    skeletons[1].x = 180;
    skeletons[1].y = 220;
    skeletons[1].dy = -1;
    skeletons[1].direction = DOWN;
    skeletons[2].x = 104;
    skeletons[2].y = 296;
    skeletons[2].direction = UP;
    skeletons[2].dy = 1;
    for(int i = 0; i < 3; i++) {
        skeletons[i].dx = 0;
        skeletons[i].width = 16;
        skeletons[i].height = 48;
        skeletons[i].timeUntilNextFrame = 10;
        skeletons[i].isMoving = 1;
        skeletons[i].active = 1;
        skeletons[i].frame = 0;
        skeletons[i].numOfFrames = 4;
        skeletons[i].hide = 0;
        skeletons[i].health = 40;
    }

}

void drawSkeletons() {
    for(int i = 0; i < 3; i++) {
        if (skeletons[i].hide) {
            shadowOAM[(20 + i)].attr0 |= (2<<8);
        } else if( ((skeletons[i].x - hOffSkeleton) < 0 || (skeletons[i].x - hOffSkeleton) > 240) || ((skeletons[i].y-vOffSkeleton) < 0 || (skeletons[i].y - vOffSkeleton) > 160) ) {
            shadowOAM[(20 + i)].attr0 |= (2<<8);
        } else if (!skeletons[i].active) {
            shadowOAM[(20 + i)].attr0 = ((skeletons[i].y - vOffSkeleton) & 0xFF) | (1<<14);
            shadowOAM[(20 + i)].attr1 = ((skeletons[i].x - hOffSkeleton) & 0x1FF) | (2<<14);


            shadowOAM[(20 + i)].attr2 = (((1) & 0xF) << 12) | (((16) * 32 + (14)) & 0x3FF);
        } else {

            shadowOAM[(20 + i)].attr0 = ((skeletons[i].y - vOffSkeleton) & 0xFF) | (2<<14);
            shadowOAM[(20 + i)].attr1 = ((skeletons[i].x - hOffSkeleton) & 0x1FF) | (3<<14);


            shadowOAM[(20 + i)].attr2 = (((1) & 0xF) << 12) | (((8*(skeletons[i].direction)) * 32 + (13 + 4*skeletons[i].frame)) & 0x3FF);
    }
    }
}
void drawPlayerFightingSkeletons() {
    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);

    } else {


        shadowOAM[0].attr0 = ((player.fighty - vOffSkeleton) & 0xFF) | (0<<14);
        shadowOAM[0].attr1 = ((player.fightx - hOffSkeleton) & 0x1FF) | (2<<14);


        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((5*player.direction) * 32 + (5)) & 0x3FF);

    }
}



void checkSkeletonCollision() {

    for(int i = 0; i < 3; i++) {
        if(skeletons[i].active) {
        if(collision(skeletons[i].x, skeletons[i].y, skeletons[i].width, skeletons[i].height, player.fightx, player.fighty, player.width, player.height)) {
            player.health-= 1;
            playSoundB(collide_data,collide_length,0);
        }
    }
    }
}

void movePlayerF3() {

     if(fightingSkeletons) {

        if ((~(buttons) & ((1<<5))) && canMoveLeft(&player, player.fightx,player.fighty)) {
            player.fightx -= player.dx;
        } else if ((~(buttons) & ((1<<4))) && canMoveRight(&player, player.fightx,player.fighty)) {
            player.fightx += player.dx;
        } else if ((~(buttons) & ((1<<6))) && canMoveUp(&player, player.fightx,player.fighty)) {
            player.fighty -= player.dy;
        } else if ((~(buttons) & ((1<<7))) && canMoveDown(&player, player.fightx,player.fighty)) {
            player.fighty += player.dy;
        }



        hOffSkeleton = player.fightx -(240 - player.width) / 2;
        vOffSkeleton = player.fighty -(160 - player.height) / 2;


        if (player.fightx < 0) player.fightx = 0;
        if (player.fighty < 0) player.fighty = 0;
        if (player.fightx > 256 - player.width) player.fightx = 256 - player.width;
        if (player.fighty > 512 - player.height) player.fighty = 512 - player.height;


        if (hOffSkeleton < 0) hOffSkeleton = 0;
        if (vOffSkeleton < 0) vOffSkeleton = 0;
        if (hOffSkeleton > 256 - 240) hOffSkeleton = 256 - 240;
        if (vOffSkeleton > 512 - 160) vOffSkeleton = 512 - 160;
    }
}



void moveSkeletons() {
    skelcount--;
    for(int i = 0; i < 3 - 2; i++) {
        if((skeletons[i].active)) {

        if(skelcount < 1) {
            skelcount = 60;
            skeletons[i].dy*= -1;


            mgba_printf(" skel 0 isMoving,dy (%d, %d)", skeletons[0].timeUntilNextFrame, skeletons[0].y);
        }
        skeletons[i].y += skeletons[i].dy;
# 256 "fight3.c"
    }
    }

}
