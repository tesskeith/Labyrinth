# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
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
} SPRITE;
# 166 "gba.h" 2
# 2 "sound.c" 2
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
# 3 "sound.c" 2
# 1 "walkTheme.h" 1


extern const unsigned int walkTheme_sampleRate;
extern const unsigned int walkTheme_length;
extern const signed char walkTheme_data[];
# 4 "sound.c" 2
# 1 "fightTheme.h" 1


extern const unsigned int fightTheme_sampleRate;
extern const unsigned int fightTheme_length;
extern const signed char fightTheme_data[];
# 5 "sound.c" 2

int minute;
int second;
int currTheme;

SPRITE player;

void setupSounds() {

    *(volatile u16 *)0x04000084 = (1<<7);

 *(volatile u16*)0x04000082 = (1<<1) |
                     (1<<2) |
                     (3<<8) |
                     (0<<10) |
                     (1<<11) |
                     (1<<3) |
                     (3<<12) |
                     (1<<14) |
                     (1<<15);

 *(u16*)0x04000080 = 0;

}

void initSongs() {


    songs[0].sampleRate = walkTheme_sampleRate;
    songs[0].length = walkTheme_length;
    unsigned char * ptr = walkTheme_data;
    songs[0].data = ptr;


    songs[1].sampleRate = fightTheme_sampleRate;
    songs[1].length = fightTheme_length;
    unsigned char * ptr1 = fightTheme_data;
    songs[1].data = ptr1;

    playSong(currTheme);

}

void playSong(int s) {


    playSoundA(songs[s].data,songs[s].length, 1);

    *(volatile unsigned short*)0x400010A = 0;
    *(volatile unsigned short*)0x4000108 = 65536 - 16384;

    *(volatile unsigned short*)0x400010E = 0;
    *(volatile unsigned short*)0x400010C = 65536 - 60;

    *(volatile unsigned short*)0x400010A = (3) | (1<<7) | (1<<6);
    *(volatile unsigned short*)0x400010E = (1<<2) | (1<<7) | (1<<6);

}


void playSoundA(const signed char* data, int dataLength, int looping) {


     DMANow(1, data, (u16*)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));


    *(volatile unsigned short*)0x4000102 = 0;
    int cyclesPerSample = (16777216) / 11025;
    *(volatile unsigned short*)0x4000100 = 65536 - cyclesPerSample;
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.isPlaying = 1;
    soundA.durationInVBlanks = ((59.727) * dataLength)/11025;
    soundA.vBlankCount = 0;
    soundA.looping = looping;


}


void playSoundB(const signed char* data, int dataLength, int looping) {


    DMANow(2, data, (u16*)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));


    *(volatile unsigned short*)0x4000106 = 0;
    int cyclesPerSample = (16777216) / 11025;
    *(volatile unsigned short*)0x4000104 = 65536 - cyclesPerSample;
    *(volatile unsigned short*)0x4000106 = (1<<7);


    soundB.isPlaying = 1;
    soundB.durationInVBlanks = ((59.727) * dataLength)/11025;
    soundB.vBlankCount = 0;
    soundB.looping = looping;

}


void pauseSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;

    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);

}


void unpauseSounds() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;

    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);

}


void stopSounds() {
    soundA.isPlaying = 0;
    dma[1].cnt = 0;
    *(volatile unsigned short*)0x4000102 = 0;

    soundB.isPlaying = 0;
    dma[2].cnt = 0;
    *(volatile unsigned short*)0x4000106 = 0;

}
