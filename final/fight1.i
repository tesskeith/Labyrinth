# 1 "fight1.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "fight1.c"


# 1 "fight1.h" 1



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
# 5 "fight1.h" 2
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
# 6 "fight1.h" 2





void initFight1();
void updateFight1();
void drawFight1();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkCollision();
void exitFight1();


extern SPRITE harpies[5];
# 4 "fight1.c" 2
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
# 5 "fight1.c" 2
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
# 6 "fight1.c" 2
# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 7 "fight1.c" 2

SPRITE harpies[5];


int collisionsEnabled;
int passed1;
int cheat;
int num;
int hOffHarpy;
int vOffHarpy;
SPRITE player;

enum {RIGHT, LEFT} DIRECTION;

void initFight1() {
    player.fightx = 0;
    player.fighty = 0;
    fightingharpies = 1;
    collisionsEnabled = 0;
    hOffHarpy = 0;
    vOffHarpy = 0;
    ((u16 *)0x5000200)[2] = (((0) & 31) | ((31) & 31) << 5 | ((0) & 31) << 10);
    ((u16 *)0x5000200)[8] = (((0) & 31) | ((31) & 31) << 5 | ((31) & 31) << 10);

    initHarpies();

}
void drawFight1() {


    drawPlayerFightingHarpies();
    drawHarpies();
    drawHealth();
    (*(volatile unsigned short *)0x04000010) = hOffHarpy;
    (*(volatile unsigned short *)0x04000012) = vOffHarpy;
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

}
void updateFight1() {

    movePlayerF1();
    moveHarpies();
    updateHealth();
    animatePlayer(&player);
    for(int i = 0; i < 5; i++) {
        animateEnemy(&harpies[i]);
    }
    checkCollision();

    if (collision(player.fightx,player.fighty,player.width,player.height,220,230,40,40)){
        exitFight1();
    }




}

void exitFight1() {
        passed1 = 1;
        for(int i = 0; i < 5; i++) {
            harpies[i].hide = 1;
        }
        mapState = 1;
        fightingharpies = 0;
        fightingMinotaur = 0;
        collisionsEnabled = 1;
        ((u16 *)0x5000200)[2] = (((9) & 31) | ((18) & 31) << 5 | ((23) & 31) << 10);
        ((u16 *)0x5000200)[8] = (((4) & 31) | ((5) & 31) << 5 | ((11) & 31) << 10);
        for(int i = 0; i < 4; i++) {
            harpies[i].hide = 1;
        }
        goToGame();
}

void initHarpies() {
    harpies[0].x = 170;
    harpies[0].y = 50;
    harpies[1].x = 200;
    harpies[1].y = 150;
    harpies[2].x = 0;
    harpies[2].y = 120;
    harpies[3].x = 210;
    harpies[3].y = 230;
    harpies[4].x = 240;
    harpies[4].y = 0;
    for(int i = 0; i<5; i++) {
        harpies[i].dx = 1;
        harpies[i].dy = 1;
        harpies[i].width = 16;
        harpies[i].height = 16;
        harpies[i].direction = LEFT;
        harpies[i].timeUntilNextFrame = 10;
        harpies[i].isMoving = 1;
        harpies[i].frame = 0;
        harpies[i].numOfFrames = 4;
        harpies[i].hide = 0;
    }
}

void drawHarpies() {
    for(int i = 0; i < 5; i++) {
        if (harpies[i].hide) {
            shadowOAM[(1 + i)].attr0 |= (2<<8);
        } else {

            shadowOAM[(1 + i)].attr0 = ((harpies[i].y - vOffHarpy) & 0xFF) | (0<<14);
            shadowOAM[(1 + i)].attr1 = ((harpies[i].x - hOffHarpy) & 0x1FF) | (1<<14);


            shadowOAM[(1 + i)].attr2 = (((0) & 0xF) << 12) | (((20 + (3*harpies[i].direction)) * 32 + (3*harpies[i].frame)) & 0x3FF);

        }
    }
}
void drawPlayerFightingHarpies() {
    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);

    } else {


        shadowOAM[0].attr0 = ((player.fighty - vOffHarpy) & 0xFF) | (2<<14);
        shadowOAM[0].attr1 = ((player.fightx - hOffHarpy) & 0x1FF) | (2<<14);


        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((5*player.frame) * 32 + (3*player.direction)) & 0x3FF);

    }
}

void movePlayerF1() {

        if ((~(buttons) & ((1<<5))) && (player.fightx > 0)) {
            player.fightx -= player.dx;
        } else if ((~(buttons) & ((1<<4))) && (player.fightx < 256 - player.width)) {
            player.fightx += player.dx;
        } else if ((~(buttons) & ((1<<6))) && (player.fighty > 0) ) {
            player.fighty -= player.dy;
        } else if ((~(buttons) & ((1<<7))) && (player.fighty < 256 - player.height)) {
            player.fighty += player.dy;
        }


        hOffHarpy = player.fightx -(240 - player.width) / 2;
        vOffHarpy = player.fighty -(160 - player.height) / 2;


        if (player.fightx < 0) player.fightx = 0;
        if (player.fighty < 0) player.fighty = 0;
        if (player.fightx > 256 - player.width) player.fightx = 256 - player.width;
        if (player.fighty > 256 - player.height) player.fighty = 256 - player.height;


        if (hOffHarpy < 0) hOffHarpy = 0;
        if (vOffHarpy < 0) vOffHarpy = 0;
        if (hOffHarpy > 256 - 240) hOffHarpy = 256 - 240;
        if (vOffHarpy > 256 - 160) vOffHarpy = 256 - 160;
}

void checkCollision() {

    for(int i = 0; i<5; i++) {

        if(!harpies[i].hide) {
        if(collision(harpies[i].x, harpies[i].y, harpies[i].width, harpies[i].height, player.fightx, player.fighty, player.width, player.height)) {
            player.health-= 10;
            harpies[i].hide = 1;
            playSoundB(collide_data,collide_length,0);
        }

    }
    }
}


void moveHarpies() {
    for(int i = 0; i< 5; i++) {
        if((harpies[i].isMoving == 1)) {
# 204 "fight1.c"
            if ((harpies[i].x < 0) || (harpies[i].x > 256 - harpies[i].width)) harpies[i].dx *=-1;
            if ((harpies[i].y < 0) || (harpies[i].y > 256 - harpies[i].height)) harpies[i].dy *=-1;
            harpies[i].x += harpies[i].dx;
            harpies[i].y += harpies[i].dy;

            }
    }
}
