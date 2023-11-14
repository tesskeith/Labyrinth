#include "gba.h"
#include "game.h"
#include "print.h"
#include "fight1.h"
#include "fight2.h"
#include "fight3.h"
#include "stdlib.h"

/* whats finished:
4 unique sprites, player movement and animation through the maze, all the different states, enemy movement/animation, both fight states, sound,parallax backgrounds and tilemap/palette modifications are finished.  
collision with the harpies  or minotaur will decrease health by 10% and reaching 0% health will lose the game
a cheat is also implemented: the player can skip one fight state by pressing LSHOULDER button while in a fight state. this will return to game state and reset health to previous level
// M03 requirements added
backgrounds : parrallax bg with maze and lava, diff backgrounds for each state
sprites: 4 different sprites, 3 with 3+ animation frames
sound: looping songs for maze and fight states, non-looping sounds for player movement and collision
changing tilemap/palette: the tilemap changes to let the player exit when both fight states have been won, the sprite palette is changed for each fight state
// how to play
for the first fight state, the player must dodge the harpies and find the exit - bottom right corner
the second fight state is won by shooting the minotaur with an arrow by facing it and pressing RSHOULDER button
game is won by finding exit - top right
// still working on:
the instruction screen has multiple pages and i will try using linked lists to display them
i am also planning on using malloc to change the tilemap more and using what we learned about saving in recitation to save a players highscore
i will also change the cheat to make it more interesting.*/
//added bg and spritesheet

#include "tilemap.h"
#include "tileset.h"
#include "lavabgTileset.h"
#include "lavabg.h"
#include "lava.h"
#include "spritesheet.h"
#include "sp2.h"
#include "sp3.h"
#include "fightbg.h"
#include "fight2bg.h"
#include "fight3bg.h"
#include "background.h"

#include "sound.h"
#include "walk.h"
#include "collide.h"

//game screens 

#include "screenMaps.h"
#include "list.h"

int currScreen;
// include collsion map
#include "collisionmap.h"
#include "fight3collision.h"

LIST* screensList;
NODE* currentNode;

void setupInterrupts();
void interruptHandler();

void initialize();

void goToStart();
void goToInstructions();
void instructions();
void start();
void goToGame();
void game();
void goToFight1();
void fight1();
void goToFight2();
void fight2();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

int hOff;
int vOff;
int mapState;
int fightingharpies;
int fightingMinotaur;
int fightingSkeletons;
int collisionsEnabled;
int passed1;
int passed2;
int passed3;
int cheat;
int seed;
int currTheme;

enum {START, INSTRUCTIONS, PAUSE, GAME, FIGHT1, FIGHT2,FIGHT3, WIN, LOSE};
int state;

OBJ_ATTR shadowOAM[128];
SPRITE player;

unsigned short oldButtons;
unsigned short buttons;

int main() {
    initialize();

    while (1) {
        oldButtons = buttons;
        buttons = REG_BUTTONS;
        // State Machine
        switch(state) {
            case START:
                start();
                break;
            case INSTRUCTIONS:
                instructions();
                break;
            case PAUSE:
                pause();
                break;
            case GAME:
                game();
                break;
            case FIGHT1:
                fight1();
                break;
            case FIGHT2:
                fight2();
                break;
            case FIGHT3:
                fight3();
                break;
            case WIN:
                win();
                break; 
            case LOSE:
                lose();
                break;               
        }
        // waitForVBlank();
        // DMANow(3, shadowOAM, OAM, 128*4);
    }
}


void initialize() {

    // Set up the display
    mgba_open();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) |SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_LARGE;
    //lava
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(26) | BG_SIZE_WIDE;

   
    // Set up the first state
    currTheme = 0;
    passed1 = 0;
    passed2 = 0;
    passed3 = 0;
    player.health = 100;
    mapState = 1;
    fightingharpies = 0;
    fightingMinotaur = 0;
    fightingSkeletons = 0;
    setupSounds();
    initSongs();
    setupInterrupts();
    // Activity 1.2: Malloc and copy the collision map into the new space
    // collisionMap = malloc(collisionmapBitmapLen);
    // DMANow(3,collisionmapBitmap, collisionMap, collisionmapBitmapLen/2);


    goToStart();
}

void setupInterrupts() {

	REG_IME = 0;

    REG_IE = IRQ_VBLANK | IRQ_TIMER(2) | IRQ_TIMER(3);
    REG_DISPSTAT = DISPSTAT_VBLANK_IRQ;

    REG_INTERRUPT = &interruptHandler;

	REG_IME = 1;

}

void interruptHandler() {

	REG_IME = 0;

	if (REG_IF & IRQ_VBLANK) {
        if (soundA.isPlaying) {
            soundA.vBlankCount += 1;
            if(soundA.vBlankCount >= soundA.durationInVBlanks) {
                if(soundA.looping) {
                    playSong(currTheme);
                    //playSoundA(soundA.data,soundA.dataLength, soundA.looping);
                    //mgba_printf("SoundA vb count and divb: (%d, %d)", soundA.vBlankCount, soundA.durationInVBlanks);
                } else {
                    soundA.isPlaying = 0;
                    REG_TM0CNT = TIMER_OFF;
                    dma[1].cnt = 0;
                }
            }

        }

        if (soundB.isPlaying) {
            soundB.vBlankCount += 1;
            if(soundB.vBlankCount >= soundB.durationInVBlanks) {
                if(soundB.looping) {
                    playSoundB(soundB.data,soundB.dataLength,soundB.looping);
                } else {
                    soundB.isPlaying = 0;
                    REG_TM1CNT = TIMER_OFF;
                    dma[2].cnt = 0;
                }
            }

		}

	}

    if (REG_IF & IRQ_TIMER(2)) {
        second = (second + 1) % 60;
    } 

    if (REG_IF & IRQ_TIMER(3)) {
        minute = (minute + 1) % 100;
    }

    REG_IF = REG_IF;
    REG_IME = 1;

}

void goToStart(){
    //display start screen
    pauseSounds();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], sizeof(startScreenTiles) / 2);
    DMANow(3, startScreenPal, PALETTE, 256);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen/ 2);
    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    waitForVBlank();
    state = START;

}

void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        unpauseSounds();
        goToGame();
        initGame();
        
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
}

void goToInstructions(){
    //display instructions screen
    pauseSounds();
    currScreen = 0;
    REG_DISPCTL = MODE(3) | BG_ENABLE(2);
    //screens with linked list
    // screensList = createList();
    // pushBack(screensList, (SCREEN) {.tilemap = instructionScreenMap,.tileMapLen = instructionScreenMapLen/ 2,.tiles =instructionScreenTiles,.tileSize = sizeof(instructionScreenTiles) / 2,.pal = instructionScreenPal });
    // pushBack(screensList, (SCREEN) {.tilemap = instructionScreen2Map,.tileMapLen = instructionScreen2MapLen/ 2,.tiles =instructionScreen2Tiles,.tileSize = sizeof(instructionScreen2Tiles) / 2,.pal = instructionScreen2Pal });
    // pushBack(screensList, (SCREEN) {.tilemap = instructionScreen3Map,.tileMapLen = instructionScreen3MapLen/ 2,.tiles =instructionScreen3Tiles,.tileSize = sizeof(instructionScreen3Tiles) / 2,.pal = instructionScreen3Pal });
    screensList = createList();
    pushBack(screensList, (SCREEN) {.bitmap = instructionScreenBitmap });
    pushBack(screensList, (SCREEN) {.bitmap = instructionScreen2Bitmap });
    pushBack(screensList, (SCREEN) {.bitmap = instructionScreen3Bitmap });
    currentNode = screensList->head;
    // DMANow(3, instructionScreenPal, PALETTE, 256);
    // DMANow(3, instructionScreenTiles, &CHARBLOCK[0], sizeof(instructionScreenTiles) / 2);
    // DMANow(3, instructionScreenMap, &SCREENBLOCK[28], instructionScreenMapLen/ 2);

    drawCurrentScreen();

    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    waitForVBlank();
    state = INSTRUCTIONS;

}

void instructions() {
    // linked list
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
            if (currentNode->prev != NULL) {
                // Activity 2.1: Move the currentNode pointer to the previous node
                currentNode= currentNode->prev;
            }
            drawCurrentScreen();
        }
        if (BUTTON_PRESSED(BUTTON_RIGHT)) {
            if (currentNode->next != NULL) {
                // Activity 2.1: Move the currentNode pointer to the next node
                currentNode = currentNode->next;
            }
            drawCurrentScreen();
        }
    // if (BUTTON_PRESSED(BUTTON_LEFT)) {
    //         if (currScreen > 0) {
    //             currScreen --;
    //         }
    //         drawCurrentScreen();
    //     }
    //     if (BUTTON_PRESSED(BUTTON_RIGHT)) {
    //         if (currScreen < 2) {
    //             currScreen++;
    //         }
    //         drawCurrentScreen();
    //     }
    

    
    if (BUTTON_PRESSED(BUTTON_A)) {
        if(mapState) {
            unpauseSounds();
            goToGame();
        } else if(fightingharpies) {
            unpauseSounds();
            goToFight1();
        } else if(fightingMinotaur) {
            unpauseSounds();
            goToFight2();
        } else if(fightingSkeletons) {
            unpauseSounds();
            goToFight3();
        } 
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        // player.health = 100;
        // passed1 = 0;
        // passed2 = 0;
        // passed3 = 0;
        // mapState = 1;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // goToStart();
    }
}

void drawCurrentScreen() {
    waitForVBlank();
    DMANow(3, currentNode->screen.bitmap,videoBuffer, 240 * 160);
    // if(currScreen == 0) {
        
    //     DMANow(3, instructionScreenTiles, &CHARBLOCK[0], sizeof(instructionScreenTiles) / 2);
    //     DMANow(3, instructionScreenPal, PALETTE, 256);
    //     DMANow(3, instructionScreenMap, &SCREENBLOCK[28], instructionScreenMapLen/ 2);
    //     } else if(currScreen == 1) {
    //         DMANow(3, instructionScreen2Tiles, &CHARBLOCK[0], sizeof(instructionScreen2Tiles) / 2);
    //         DMANow(3, instructionScreen2Pal, PALETTE, 256);
    //         DMANow(3, instructionScreen2Map, &SCREENBLOCK[28], instructionScreen2MapLen/ 2);
    //     } else if(currScreen == 2) {
    //         DMANow(3, instructionScreen3Tiles, &CHARBLOCK[0], sizeof(instructionScreen3Tiles) / 2);
    //         DMANow(3, instructionScreen3Pal, PALETTE, 256);
    //         DMANow(3, instructionScreen3Map, &SCREENBLOCK[28], instructionScreen3MapLen/ 2);
    //     }
} 

void goToPause() {
    pauseSounds();
    //display pause screen
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], sizeof(pauseScreenTiles) / 2);
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen/ 2);

    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    waitForVBlank();
    state = PAUSE;
}

void pause(){
    if (BUTTON_PRESSED(BUTTON_START)) {
        if(mapState) {
            unpauseSounds();
            goToGame();
        } else if(fightingharpies) {
            unpauseSounds();
            goToFight1();
        } else if(fightingMinotaur) {
            unpauseSounds();
            goToFight2();
        } else if(fightingSkeletons) {
            unpauseSounds();
            goToFight3();
        } 
    } else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // player.health = 100;
        // goToStart();
    }
        
}

void goToGame() {
    currTheme = 0;
    playSong(currTheme);
    waitForVBlank();
    // TODO: load your tilemap into screenblock 28
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) | BG_ENABLE(1) |SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2); // loading tileset into charblock 0
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2); // loading palette (note: if recoloring, change this palette)
    DMANow(3, tilemapMap, &SCREENBLOCK[28], tilemapMapLen / 2);

    collisionMap = (unsigned char*) collisionmapBitmap;

     //sprites 
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);

    //lava
    //DMANow(3, lavaTiles, &CHARBLOCK[1], sizeof(lavaTiles) / 2);
    //DMANow(3, lavaPal, PALETTE +16, sizeof(lavaPal)/2);
    DMANow(3, lavaMap, &SCREENBLOCK[26], lavaMapLen / 2);

    // DMANow(3, backgroundTiles, &CHARBLOCK[1], sizeof(backgroundTiles) / 2);
    // DMANow(3, tilesetPal, PALETTE + 16, sizeof(tilesetPal)/2);
    // DMANow(3, backgroundMap, &SCREENBLOCK[27], backgroundMapLen/ 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    waitForVBlank();
    
    state = GAME;

}
// Runs every frame of the game state
void game() {
    updateGame();
    //testTilemap();
    drawGame();
    if(player.health < 1 ){
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    } 
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // player.health = 100;
        // goToStart();
    }
}

void goToFight1() {
    currTheme = 1;
    playSong(currTheme);
    waitForVBlank();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) |SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    // TODO: load your tilemap into screenblock 28
    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2); // loading tileset into charblock 0
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2); // loading palette (note: if recoloring, change this palette)
    DMANow(3, fightbgMap, &SCREENBLOCK[28], fightbgMapLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    if(!fightingharpies) {
        initFight1();
    }
    waitForVBlank();
    
    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    state = FIGHT1;

}
// Runs every frame of the game state
void fight1() {
    updateFight1();
    //testTilemap();
    drawFight1();
    
    if(player.health < 1 ){
        goToLose();
    }
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // player.health = 100;
        // goToStart();
    }
}


void goToFight2() {
    currTheme = 1;
    playSong(currTheme);
    waitForVBlank();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) |SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2); // loading tileset into charblock 0
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2); // loading palette (note: if recoloring, change this palette)
    DMANow(3, fight2bgMap, &SCREENBLOCK[28], fight2bgMapLen / 2);
    
    DMANow(3, sp2Tiles, &CHARBLOCK[4], sp2TilesLen / 2);
    DMANow(3, sp2Pal, SPRITEPALETTE, sp2PalLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    if(!fightingMinotaur) {
        initFight2();
    }
    state = FIGHT2;
}

void fight2() {
    updateFight2();
    //testTilemap();
    drawFight2();
    
    if(player.health < 1 ){
        goToLose();
    } 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // player.health = 100;
        // goToStart();
    }
}

void goToFight3() {
    currTheme = 1;
    playSong(currTheme);
    waitForVBlank();
    REG_DISPCTL = MODE(0) | BG_ENABLE(0) |SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_TALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, tilesetTiles, &CHARBLOCK[0], sizeof(tilesetTiles)/2); // loading tileset into charblock 0
    DMANow(3, tilesetPal, PALETTE, sizeof(tilesetPal)/2); // loading palette (note: if recoloring, change this palette)
    DMANow(3, fight3bgMap, &SCREENBLOCK[28], fight3bgMapLen / 2);
    DMANow(3, sp3Tiles, &CHARBLOCK[4], sp3TilesLen / 2);
    DMANow(3, sp3Pal, SPRITEPALETTE, sp3PalLen / 2);

    hideSprites();
    DMANow(3, shadowOAM, OAM, 512);
    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    //mgba_printf("Position at initFight3: (%d)", fightingSkeletons);
    if(!fightingSkeletons) {
        //mgba_printf("Position at initFight3: (%d, %d)", player.x, player.y);
        initFight3();
    }
    state = FIGHT3;
}

void fight3() {
    updateFight3();
    //testTilemap();
    drawFight3();
    
    if(player.health < 1 ){
        goToLose();
    } 
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToInstructions();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // player.health = 100;
        // goToStart();
    }
}

void goToWin() {
    pauseSounds();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], sizeof(winScreenTiles) / 2);
    DMANow(3, winScreenPal, PALETTE, 256);
    DMANow(3, winScreenMap, &SCREENBLOCK[28], winScreenMapLen/ 2);

    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    hideSprites();
    //DMANow(3, shadowOAM, OAM, 512);
    state = WIN;
}

void win(){
    if(BUTTON_HELD(BUTTON_START)){
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // player.health = 100;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // goToStart();
    }
        
}

void goToLose() {
    pauseSounds();
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], sizeof(loseScreenTiles) / 2);
    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen/ 2);

    //center screen
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = LOSE;
}

void lose(){
    if(BUTTON_HELD(BUTTON_START)){
        initialize();
        // passed1 = 0;
        // passed2 = 0;
        // mapState = 1;
        // player.health = 100;
        // fightingharpies = 0;
        // fightingMinotaur = 0;
        // fightingSkeletons = 0;
        // goToStart();
    }
}
