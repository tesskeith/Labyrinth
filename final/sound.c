#include "gba.h"
#include "sound.h"
#include "walkTheme.h"
#include "fightTheme.h"

int minute;
int second;
int currTheme;

SPRITE player;

void setupSounds() {

    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_RATIO_100 |
                     DSA_OUTPUT_TO_BOTH |
                     DSA_TIMER0 |
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 |
                     DSB_OUTPUT_TO_BOTH |
                     DSB_TIMER1 |
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;

}

void initSongs() {

    // TODO 4.2: Set songs[0] struct members
    songs[0].sampleRate = walkTheme_sampleRate;
    songs[0].length = walkTheme_length;
    unsigned char * ptr = walkTheme_data;
    songs[0].data = ptr;

    // TODO 6.3: Set songs[1] and songs[2] struct members
    songs[1].sampleRate = fightTheme_sampleRate;
    songs[1].length = fightTheme_length;
    unsigned char * ptr1 = fightTheme_data;
    songs[1].data = ptr1; 

    playSong(currTheme);

} 

void playSong(int s) {

    // TODO 4.3: Play song at index s of songs
    playSoundA(songs[s].data,songs[s].length, 1);

    REG_TM2CNT = 0;
    REG_TM2D = 65536 - 16384;
    
    REG_TM3CNT = 0;
    REG_TM3D = 65536 - 60;
    
    REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;

}

// TODO 1.0: Complete this function
void playSoundA(const signed char* data, int dataLength, int looping) {
    
    // Set DMA channel to 1
     DMANow(1, data, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 0
    REG_TM0CNT = 0;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM0D = 65536 - cyclesPerSample;
    REG_TM0CNT = TIMER_ON;
    // Initialize struct members of soundA
    soundA.isPlaying = 1;
    soundA.durationInVBlanks = (VBLANK_FREQ * dataLength)/SOUND_FREQ;
    soundA.vBlankCount = 0;
    soundA.looping = looping;


}

// TODO 1.1: Complete this function
void playSoundB(const signed char* data, int dataLength, int looping) {

    // Set DMA channel to 2
    DMANow(2, data, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

    // Set up timer 1
    REG_TM1CNT = 0;
    int cyclesPerSample = PROCESSOR_CYCLES_PER_SECOND / SOUND_FREQ;
    REG_TM1D = 65536 - cyclesPerSample;
    REG_TM1CNT = TIMER_ON;

    // Initialize struct members of soundB
    soundB.isPlaying = 1;
    soundB.durationInVBlanks = (VBLANK_FREQ * dataLength)/SOUND_FREQ;
    soundB.vBlankCount = 0;
    soundB.looping = looping;

}

// TODO 5.0: Complete this function
void pauseSounds() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;

    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;

}

// TODO 5.1: Complete this function
void unpauseSounds() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;

    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;

}

// TODO 5.2: Complete this function
void stopSounds() {
    soundA.isPlaying = 0;
    dma[1].cnt = 0;
    REG_TM0CNT = 0;

    soundB.isPlaying = 0;
    dma[2].cnt = 0;
    REG_TM1CNT = 0;   

} 