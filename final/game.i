# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1



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
# 5 "game.h" 2
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
# 2 "game.c" 2
# 1 "fight1.h" 1
# 11 "fight1.h"
void initFight1();
void updateFight1();
void drawFight1();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkCollision();
void exitFight1();


extern SPRITE harpies[5];
# 3 "game.c" 2
# 1 "fight2.h" 1
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
# 4 "game.c" 2
# 1 "fight3.h" 1
# 11 "fight3.h"
void initFight3();
void updateFight3();
void drawFight3();
void initHarpies();
void moveHarpies();
void drawHarpies();
void checkSkeletonCollision();
void exitFight3();


extern SPRITE skeletons[3];
# 5 "game.c" 2
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
# 6 "game.c" 2
# 1 "walk.h" 1


extern const unsigned int walk_sampleRate;
extern const unsigned int walk_length;
extern const signed char walk_data[];
# 7 "game.c" 2

# 1 "collisionmap.h" 1
# 21 "collisionmap.h"
extern const unsigned short collisionmapBitmap[131072];


extern const unsigned short collisionmapPal[256];
# 9 "game.c" 2
# 1 "collisionmap2.h" 1
# 21 "collisionmap2.h"
extern const unsigned short collisionmap2Bitmap[131072];


extern const unsigned short collisionmap2Pal[256];
# 10 "game.c" 2

# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 12 "game.c" 2

inline unsigned char colorAt(int x, int y);



int healthCountdown;
unsigned char* collisionMap;
int collisionsEnabled;

int newArrow;
SPRITE arrows[5];


int hOff;
int vOff;
int hOffSkeleton;
int vOffSkeleton;

SPRITE player;

enum { DOWN, UP, RIGHT, LEFT} DIRECTION;

void initGame() {
    collisionMap = (unsigned char*) collisionmapBitmap;
    collisionsEnabled = 1;
    healthCountdown = 200;
    for(int i = 0; i < 5; i++) {
        arrows[i].hide = 1;
    }
    initPlayer();
    newArrow = 0;

    hOff = 0;
    vOff = 0;


}



void initPlayer() {
    player.x = 32;
    player.y = 460;
    player.dx = 1;
    player.dy = 1;
    player.width = 24;
    player.height = 40;
    player.direction = UP;
    player.isMoving = 0;
    player.timeUntilNextFrame = 20;
    player.frame = 0;
    player.numOfFrames = 3;
    player.hide = 1;
}

void updateGame() {
    if(mapState) {
        player.hide = 0;
    }
    movePlayer();
    animatePlayer(&player);
    updateHealth();
    checkCollision();

    if(passed2) {


        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 5; j++) {

                ((screenblock *)0x6000000)[28].tilemap[((12 + j) * (32) + (25 + i))] = 66;
            }
        }


        collisionMap = (unsigned char*) collisionmap2Bitmap;







    }

    if (collision(player.x,player.y,player.width,player.height,270,256,40,40) & !passed1){
        mapState = 0;
        goToFight1();
    } else if (collision(player.x,player.y,player.width,player.height,208,176,40,40) & !passed2){
        mapState = 0;
        goToFight2();
    } else if (collision(player.x,player.y,player.width,player.height,432,432,40,40) & !passed3){
        mapState = 0;
        goToFight3();
    } else if ((player.x < 160 & player.x > 100) & player.y < 40){
        player.hide = 1;
        goToWin();
    }

}

void drawGame() {


    drawPlayer();
    drawHealth();
    drawArrows();

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff*2;
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

}

void drawPlayer() {
    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);

    } else {


        shadowOAM[0].attr0 = ((player.y - vOff) & 0xFF) | (2<<14);
        shadowOAM[0].attr1 = ((player.x - hOff) & 0x1FF) | (2<<14);


        shadowOAM[0].attr2 = (((0) & 0xF) << 12) | (((5*player.frame) * 32 + (3*player.direction)) & 0x3FF);

    }
}


inline unsigned char colorAt(int x, int y){
    if(fightingSkeletons) {
        return collisionMap[((y) * (256) + (x))];
    }
    return collisionMap[((y) * (512) + (x))];

}


int canMoveLeft(SPRITE *sprite, int x, int y) {

    if (!collisionsEnabled) return 1;

    int left = x;
    int top = y;
    int bottom =y + sprite->height -1;
    return colorAt(left - sprite->dx,top ) && colorAt(left - sprite->dx,bottom );

}


int canMoveRight(SPRITE *sprite,int x, int y) {

    if (!collisionsEnabled) return 1;

    int right = x + sprite->width -1;
    int top = y;
    int bottom =y + sprite->height -1;

    return colorAt(right +sprite->dx,top ) && colorAt(right + sprite->dx,bottom);

}


int canMoveUp(SPRITE *sprite, int x, int y) {

    if (!collisionsEnabled) return 1;

    int left = x;
    int right = x + sprite->width -1;
    int top = y;

    return colorAt(left,top - sprite->dy) && colorAt(right,top - sprite->dy);

}



int canMoveDown(SPRITE *sprite, int x, int y) {

    if (!collisionsEnabled) return 1;

    int left = x;
    int right = x + sprite->width -1;
    int bottom = y + sprite->height -1;

    return colorAt(left,bottom + sprite->dy) && colorAt(right,bottom + sprite->dy);

}

int enemyCanMove(SPRITE *sprite) {

    if (!collisionsEnabled) return 1;

    int lateral = sprite->x + sprite->dx;
    int vertical = sprite->y + sprite->dy;
    return colorAt(lateral,vertical );

}

void shootArrow(int cheat) {
    newArrow = newArrow % 5;
    arrows[newArrow].direction = player.direction;

    arrows[newArrow].dx = 2;
    arrows[newArrow].dy = 2;
    arrows[newArrow].isMoving = 1;


    if(cheat){
        arrows[newArrow].width = 32;
        arrows[newArrow].height = 32;
        arrows[newArrow].numOfFrames = 7;
        arrows[newArrow].timeUntilNextFrame = 26;
        arrows[newArrow].frame = 0;
        arrows[newArrow].cheat = 1;
        if(fightingMinotaur) {
                arrows[newArrow].y = ((player.fighty) >> 8);
            } else {
                arrows[newArrow].y = player.fighty;
            }
        arrows[newArrow].x = player.fightx;


    } else {
        arrows[newArrow].cheat = 0;
     if(arrows[newArrow].direction == RIGHT || arrows[newArrow].direction == LEFT) {
        arrows[newArrow].width = 32;
        arrows[newArrow].height = 8;
        arrows[newArrow].x = player.fightx;
            if(fightingMinotaur) {
                arrows[newArrow].y = ((player.fighty) >> 8) + 16;
            } else {
                arrows[newArrow].y = player.fighty + 12;
            }
    } else {
        arrows[newArrow].width = 8;
        arrows[newArrow].height = 32;
        arrows[newArrow].y = player.fighty;
        arrows[newArrow].x = player.fightx + 12;
    }
    }
    arrows[newArrow].active = 1;
    arrows[newArrow].hide = 0;
}

void drawArrows() {
    int xpos;
    int ypos;

    for(int i = 0; i < 5; i++) {
        if(fightingMinotaur) {
            xpos = arrows[i].x ;
            ypos = arrows[i].y;
        } else if(fightingSkeletons) {
            xpos = arrows[i].x - hOffSkeleton;
            ypos = arrows[i].y - vOffSkeleton;
        }
        if (arrows[i].hide) {
            shadowOAM[(7 + i)].attr0 |= (2<<8);
        } else {
            if (arrows[i].cheat) {
                shadowOAM[(7 + i)].attr0 = ((ypos) & 0xFF) | (0<<14);
                shadowOAM[(7 + i)].attr1 = ((xpos) & 0x1FF) | (2<<14);

                shadowOAM[(7 + i)].attr2 = (((0) & 0xF) << 12) | (((4*arrows[i].frame) * 32 + (0)) & 0x3FF);
            } else if(arrows[i].direction == RIGHT || arrows[i].direction == LEFT) {
                shadowOAM[(7 + i)].attr0 = ((ypos) & 0xFF) | (1<<14);
                shadowOAM[(7 + i)].attr1 = ((xpos) & 0x1FF) | (1<<14);

                shadowOAM[(7 + i)].attr2 = (((0) & 0xF) << 12) | (((4*arrows[i].direction) * 32 + (9)) & 0x3FF);
            } else {
                shadowOAM[(7 + i)].attr0 = ((ypos) & 0xFF) | (2<<14);
                shadowOAM[(7 + i)].attr1 = ((xpos) & 0x1FF) | (1<<14);

                shadowOAM[(7 + i)].attr2 = (((0) & 0xF) << 12) | (((4*arrows[i].direction) * 32 + (9)) & 0x3FF);
            }



        }
    }
}


void checkArrowCollision(SPRITE *sprite) {

    for(int i = 0; i < 5; i++) {
        if(!arrows[i].hide) {

            if(collision(arrows[i].x, arrows[i].y, arrows[i].width, arrows[i].height, sprite->x, sprite->y, sprite->width, sprite->height)) {
                if(arrows[i].cheat) {
                    sprite->health == 0;
                } else {
                    sprite->health -=5;
                }
                if((sprite->health < 1) || arrows[i].cheat){
                    if(fightingMinotaur) {

                        exitFight2();
                        sprite->hide = 1;
                    }
                    if(fightingSkeletons) {
                        sprite->active = 0;
                    }
                }
                arrows[i].hide = 1;
            }
        }
    }
}


void moveArrows() {
    for(int i = 0; i< 5; i++) {
        if(arrows[i].active) {
            if ( arrows[i].direction == LEFT) {
                arrows[i].x -= arrows[i].dx;
            } else if ( arrows[i].direction == RIGHT) {
                arrows[i].x += arrows[i].dx;
            } else if ( arrows[i].direction == DOWN) {
                arrows[i].y += arrows[i].dy;
            } else if ( arrows[i].direction == UP) {
                arrows[i].y -= arrows[i].dy;
            }



            if(fightingMinotaur) {
                if ((arrows[i].x < 0) || (arrows[i].x > 240 - arrows[i].width)){

                arrows[i].hide = 1;
                arrows[i].active = 0;
            }
            if ((arrows[i].y < 0) || (arrows[i].y > 160 - arrows[i].height)){
                arrows[i].hide = 1;
                arrows[i].active = 0;
            }
            } else if (fightingSkeletons) {
                 if (((arrows[i].x - hOffSkeleton) < 0) || (arrows[i].x - hOffSkeleton > 240 - arrows[i].width)){
                arrows[i].hide = 1;
                arrows[i].active = 0;
            }
            if (((arrows[i].y - vOffSkeleton ) < 0) || (arrows[i].y - vOffSkeleton > 160 - arrows[i].height)){
                arrows[i].hide = 1;
                arrows[i].active = 0;
            }
            }

        }
    }
}


void movePlayer() {

     if(mapState) {

        if ((~(buttons) & ((1<<5))) && canMoveLeft(&player, player.x,player.y)) {

            player.x -= player.dx;
        } else if ((~(buttons) & ((1<<4))) && canMoveRight(&player, player.x,player.y)) {
            player.x += player.dx;
        } else if ((~(buttons) & ((1<<6))) && canMoveUp(&player, player.x,player.y)) {
            player.y -= player.dy;
        } else if ((~(buttons) & ((1<<7))) && canMoveDown(&player, player.x,player.y)) {

            player.y += player.dy;
        }

        if(collisionsEnabled) {

        hOff = player.x -(240 - player.width) / 2;
        vOff = player.y -(160 - player.height) / 2;


        if (player.x < 0) player.x = 0;
        if (player.y < 0) player.y = 0;
        if (player.x > 512 - player.width) player.x = 512 - player.width;
        if (player.y > 512 - player.height) player.y = 512 - player.height;


        if (hOff < 0) hOff = 0;
        if (vOff < 0) vOff = 0;
        if (hOff > 512 - 240) hOff = 512 - 240;
        if (vOff > 512 - 160) vOff = 512 - 160;
        }
    }
}


void animatePlayer(SPRITE *sprite) {

       sprite->isMoving = 0;

    if ((~(buttons) & ((1<<6)))) {
        sprite->isMoving = 1;
        sprite->direction = UP;
    }

    if ((~(buttons) & ((1<<7)))) {
        sprite->isMoving = 1;
        sprite->direction = DOWN;
    }

    if ((~(buttons) & ((1<<5)))) {
        sprite->isMoving = 1;
        sprite->direction = LEFT;
    }

    if ((~(buttons) & ((1<<4)))) {
        sprite->isMoving = 1;
        sprite->direction = RIGHT;
    }


    if(sprite->isMoving) {
        sprite->timeUntilNextFrame--;
        if(sprite->timeUntilNextFrame == 0) {
            sprite->timeUntilNextFrame = 20;
            sprite->frame = (sprite->frame + 1) % sprite->numOfFrames;
            playSoundB(walk_data,walk_length,0);

        }

    } else {
            sprite->frame = 0;
            sprite->timeUntilNextFrame = 10;
        }
}

void animateEnemy(SPRITE *sprite) {


        sprite->timeUntilNextFrame--;
        if(sprite->timeUntilNextFrame == 0) {
            sprite->timeUntilNextFrame = 10;
            sprite->frame = (sprite->frame + 1) % sprite->numOfFrames;
        }
}


void drawHealth(){

    shadowOAM[10].attr0 = ((10) & 0xFF) | (1<<14);
    shadowOAM[10].attr1 = ((136) & 0x1FF) | (1<<14);
    shadowOAM[10].attr2 = (((0) & 0xF) << 12) | (((31) * 32 + (10)) & 0x3FF);
    shadowOAM[11].attr0 = ((10) & 0xFF) | (1<<14);
    shadowOAM[11].attr1 = ((168) & 0x1FF) | (1<<14);
    shadowOAM[11].attr2 = (((0) & 0xF) << 12) | (((31) * 32 + (14)) & 0x3FF);

    int ones = player.health % 10;
    int tens = player.health / 10 % 10;
    int hundreds = player.health / 100 % 10;

    for (int i = 0; i<4; i++) {
        shadowOAM[12 + i].attr0 = ((10) & 0xFF) | (0<<14);
        shadowOAM[12 + i].attr1 = ((200 + (i*8)) & 0x1FF) | (0<<14);
    }

    if(player.health < 100) {
        hundreds = 20;
    }
    shadowOAM[12].attr2 = (((0) & 0xF) << 12) | (((31) * 32 + (hundreds)) & 0x3FF);
    shadowOAM[13].attr2 = (((0) & 0xF) << 12) | (((31) * 32 + (tens)) & 0x3FF);
    shadowOAM[14].attr2 = (((0) & 0xF) << 12) | (((31) * 32 + (ones)) & 0x3FF);
    shadowOAM[15].attr2 = (((0) & 0xF) << 12) | (((31) * 32 + (18)) & 0x3FF);


}

void updateHealth(){
    healthCountdown--;
    if(healthCountdown == 0){
        player.health--;
        healthCountdown = 200;
    }
}
