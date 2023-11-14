

#include "fight3.h"
#include "print.h"exi
#include "sound.h"
#include "collide.h"
#include "fight3collision.h"

SPRITE skeleton;

//int winFight3 = 0;
int collisionsEnabled;
int passed3;
int hOffSkeleton;
int vOffSkeleton;
int skelcount;
SPRITE player;
SPRITE skeletons[SKELETONCOUNT];

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
    //SPRITEPALETTE[2] = GREEN;
    //SPRITEPALETTE[8] = CYAN;
    //initPlayer();
    //mgba_printf("Position at initFight3: (%d, %d)", player.fightx, player.fighty);
    initSkeletons();

}
void drawFight3() {

    // Draw sprites
    drawPlayerFightingSkeletons();
    drawSkeletons();
    drawArrows();
    drawHealth();
    REG_BG0HOFF = hOffSkeleton;
    REG_BG0VOFF = vOffSkeleton;
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

}
void updateFight3() {
    if (BUTTON_HELD(BUTTON_RSHOULDER)){
        //mgba_printf("skel Position: (%d, %d)", player.x, player.y);
        shootArrow(0);
        newArrow++;
    }
     //use cheat
    if(BUTTON_PRESSED(BUTTON_LSHOULDER)) {
       shootArrow(1);
       newArrow++;
    }
    moveArrows();
    for(int i = 0; i < SKELETONCOUNT; i++) {
        checkArrowCollision(&skeletons[i]);
    }

    // if(skeleton.health == 100) {
    //     skeleton.x = 184;
    //     skeleton.y = 100;
    //     skeleton.dy = -1;
    // } else if(skeleton.health == 50) {
    //     skeleton.x = 104;
    //     skeleton.y = 296;
    //     skeleton.dy = 1;
    
    // }
    
    movePlayerF3();
    moveSkeletons();
    updateHealth();
    animatePlayer(&player);
    for(int i = 0; i < SKELETONCOUNT; i++) {
        animateEnemy(&skeletons[i]);
    }
    for(int i = 0; i < ARROWCOUNT; i++) {
        if(arrows[i].cheat) {
            animateEnemy(&arrows[i]);
        } 
    }
    checkSkeletonCollision();
 // finds exit
    if (collision(player.fightx,player.fighty,player.width,player.height,220,460,40,40)){
        exitFight3();
    } 


    

}

void exitFight3() {
        passed3 = 1;
        for(int i = 0; i < SKELETONCOUNT; i++) {
            skeletons[i].hide = 1;
        }
        for(int i = 0; i < ARROWCOUNT; i++) {
            arrows[i].hide = 1;
        }
        mapState = 1;
        fightingharpies = 0;
        fightingMinotaur = 0;
        fightingSkeletons = 0;
        collisionsEnabled = 1;
        SPRITEPALETTE[2] = BLUE2;
        SPRITEPALETTE[8] = BLUE8;
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
    for(int i = 0; i < SKELETONCOUNT; i++) {
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
    for(int i = 0; i < SKELETONCOUNT; i++) {
        if (skeletons[i].hide) {
            shadowOAM[(20 + i)].attr0 |= ATTR0_HIDE;
        } else if( ((skeletons[i].x - hOffSkeleton) < 0 || (skeletons[i].x - hOffSkeleton) > SCREENWIDTH) || ((skeletons[i].y-vOffSkeleton) < 0 || (skeletons[i].y - vOffSkeleton) > SCREENHEIGHT) ) {
            shadowOAM[(20 + i)].attr0 |= ATTR0_HIDE;
        } else if (!skeletons[i].active) {
            shadowOAM[(20 + i)].attr0 = ATTR0_Y(skeletons[i].y - vOffSkeleton) | ATTR0_WIDE;
            shadowOAM[(20 + i)].attr1 = ATTR1_X(skeletons[i].x - hOffSkeleton) | ATTR1_MEDIUM;

        // Update ATTR2_TILEID to use direction and currentFrame
            shadowOAM[(20 + i)].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(14, 16);
        } else {

            shadowOAM[(20 + i)].attr0 = ATTR0_Y(skeletons[i].y - vOffSkeleton) | ATTR0_TALL;
            shadowOAM[(20 + i)].attr1 = ATTR1_X(skeletons[i].x - hOffSkeleton) | ATTR1_LARGE;

        // Update ATTR2_TILEID to use direction and currentFrame
            shadowOAM[(20 + i)].attr2 = ATTR2_PALROW(1) | ATTR2_TILEID(13 + 4*skeletons[i].frame, 8*(skeletons[i].direction));
    }
    }
}
void drawPlayerFightingSkeletons() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;

    } else {

        //Change where player is drawn based on camera position
        shadowOAM[0].attr0 = ATTR0_Y(player.fighty - vOffSkeleton) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = ATTR1_X(player.fightx - hOffSkeleton) | ATTR1_MEDIUM;

        // Update ATTR2_TILEID to use direction and frame
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 5*player.direction);

    }
}



void checkSkeletonCollision() {
    //check player collision with skeletons
    for(int i = 0; i < SKELETONCOUNT; i++) {
        if(skeletons[i].active) {
        if(collision(skeletons[i].x, skeletons[i].y, skeletons[i].width, skeletons[i].height, player.fightx, player.fighty, player.width, player.height)) {
            player.health-= 1;
            playSoundB(collide_data,collide_length,0);
        }
    }
    }
}

void movePlayerF3() {
    // movement in fight state
     if(fightingSkeletons) {
        // movement through map
        if (BUTTON_HELD(BUTTON_LEFT) && canMoveLeft(&player, player.fightx,player.fighty)) {
            player.fightx -= player.dx;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && canMoveRight(&player, player.fightx,player.fighty)) {
            player.fightx += player.dx;
        } else if (BUTTON_HELD(BUTTON_UP) && canMoveUp(&player, player.fightx,player.fighty)) {
            player.fighty -= player.dy;
        } else if (BUTTON_HELD(BUTTON_DOWN) && canMoveDown(&player, player.fightx,player.fighty)) {
            player.fighty += player.dy;
        }
        //mgba_printf("Position at Fight3 movePlayer : (%d, %d)", player.fightx, player.fighty);
            
            //Set camera position based on new player position
        hOffSkeleton = player.fightx -(SCREENWIDTH - player.width) / 2;
        vOffSkeleton = player.fighty -(SCREENHEIGHT - player.height) / 2;

        //  Restrict player movement to map
        if (player.fightx < 0) player.fightx = 0;
        if (player.fighty < 0) player.fighty = 0;
        if (player.fightx > SMAPWIDTH - player.width) player.fightx = SMAPWIDTH - player.width;
        if (player.fighty > SMAPHEIGHT - player.height) player.fighty = SMAPHEIGHT - player.height;

        // Complex Movement Activity 3.1: Restrict camera movement to map
        if (hOffSkeleton < 0) hOffSkeleton = 0;
        if (vOffSkeleton < 0) vOffSkeleton = 0;
        if (hOffSkeleton > SMAPWIDTH - SCREENWIDTH) hOffSkeleton = SMAPWIDTH - SCREENWIDTH;
        if (vOffSkeleton > SMAPHEIGHT - SCREENHEIGHT) vOffSkeleton = SMAPHEIGHT - SCREENHEIGHT;
    }
}


// make skeletons chase player
void moveSkeletons() {
    skelcount--;
    for(int i = 0; i < SKELETONCOUNT - 2; i++) {
        if((skeletons[i].active)) {
        //movement through map
        if(skelcount < 1) {
            skelcount = 60;
            skeletons[i].dy*= -1;
                
            
            mgba_printf(" skel 0 isMoving,dy (%d, %d)", skeletons[0].timeUntilNextFrame, skeletons[0].y);
        }
        skeletons[i].y += skeletons[i].dy;
        
        // } else if (canMoveDown(&skeleton, skeletons[i].x,skeletons[i].y )) {
        //     skeletons[i].y += skeletons[i].dy;
        //     skeletons[i].direction = DOWN;
        // } else {
        //     skeletons[i].direction = UP;  skeletons[2].x = 104;
        // }
       
    }
    }
    //mgba_printf(" skel 0 position at Fight3: (%d, %d)", skeletons[0].x, skeletons[0].y);
}
