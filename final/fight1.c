

#include "fight1.h"
#include "print.h"
#include "sound.h"
#include "collide.h"

SPRITE harpies[HARPYCOUNT];

//int winFight1 = 0;
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
    SPRITEPALETTE[2] = GREEN;
    SPRITEPALETTE[8] = CYAN;
    //initPlayer();
    initHarpies();

}
void drawFight1() {

    // Draw sprites
    drawPlayerFightingHarpies();
    drawHarpies();
    drawHealth();
    REG_BG0HOFF = hOffHarpy;
    REG_BG0VOFF = vOffHarpy;
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

}
void updateFight1() {

    movePlayerF1();
    moveHarpies();
    updateHealth();
    animatePlayer(&player);
    for(int i = 0; i < HARPYCOUNT; i++) {
        animateEnemy(&harpies[i]);
    }
    checkCollision();
 // finds exit
    if (collision(player.fightx,player.fighty,player.width,player.height,220,230,40,40)){
        exitFight1();
    } 


    //mgba_printf("Position: (%d, %d)", player.fightx, player.fighty);

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
        SPRITEPALETTE[2] = BLUE2;
        SPRITEPALETTE[8] = BLUE8;
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
    for(int i = 0; i<HARPYCOUNT; i++) {
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
    for(int i = 0; i < HARPYCOUNT; i++) {
        if (harpies[i].hide) {
            shadowOAM[(1 + i)].attr0 |= ATTR0_HIDE;
        } else {

            shadowOAM[(1 + i)].attr0 = ATTR0_Y(harpies[i].y - vOffHarpy ) | ATTR0_SQUARE;
            shadowOAM[(1 + i)].attr1 = ATTR1_X(harpies[i].x - hOffHarpy ) | ATTR1_SMALL;

        // Update ATTR2_TILEID to use direction and currentFrame
            shadowOAM[(1 + i)].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*harpies[i].frame, 20 + (3*harpies[i].direction));

        }
    }
}
void drawPlayerFightingHarpies() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;

    } else {

        //Change where player is drawn based on camera position
        shadowOAM[0].attr0 = ATTR0_Y(player.fighty - vOffHarpy) | ATTR0_TALL;
        shadowOAM[0].attr1 = ATTR1_X(player.fightx - hOffHarpy) | ATTR1_MEDIUM;

        // Update ATTR2_TILEID to use direction and frame
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*player.direction, 5*player.frame);

    }
}

void movePlayerF1() {
        //move with button press and bounds of screen
        if (BUTTON_HELD(BUTTON_LEFT) && (player.fightx > 0)) {
            player.fightx -= player.dx;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && (player.fightx < HMAPWIDTH - player.width)) {
            player.fightx += player.dx;
        } else if (BUTTON_HELD(BUTTON_UP) && (player.fighty > 0) ) {
            player.fighty -= player.dy;
        } else if (BUTTON_HELD(BUTTON_DOWN) && (player.fighty < HMAPHEIGHT - player.height)) {
            player.fighty += player.dy;
        }

        //Set camera position based on new player position
        hOffHarpy = player.fightx -(SCREENWIDTH - player.width) / 2;
        vOffHarpy = player.fighty -(SCREENHEIGHT - player.height) / 2;

        //  Restrict player movement to map
        if (player.fightx < 0) player.fightx = 0;
        if (player.fighty < 0) player.fighty = 0;
        if (player.fightx > HMAPWIDTH - player.width) player.fightx = HMAPWIDTH - player.width;
        if (player.fighty > HMAPHEIGHT - player.height) player.fighty = HMAPHEIGHT - player.height;

        //  Restrict camera movement to map
        if (hOffHarpy < 0) hOffHarpy = 0;
        if (vOffHarpy < 0) vOffHarpy = 0;
        if (hOffHarpy > HMAPWIDTH - SCREENWIDTH) hOffHarpy = HMAPWIDTH - SCREENWIDTH;
        if (vOffHarpy > HMAPHEIGHT - SCREENHEIGHT) vOffHarpy = HMAPHEIGHT - SCREENHEIGHT;
}

void checkCollision() {
    //check player collision with harpies
    for(int i = 0; i<HARPYCOUNT; i++) {
        //with player
        if(!harpies[i].hide) {
        if(collision(harpies[i].x, harpies[i].y, harpies[i].width, harpies[i].height, player.fightx, player.fighty, player.width, player.height)) {
            player.health-= 10;
            harpies[i].hide = 1;
            playSoundB(collide_data,collide_length,0);
        }

    }
    }
}

// make harpies chase player
void moveHarpies() {
    for(int i = 0; i< HARPYCOUNT; i++) {
        if((harpies[i].isMoving == 1)) {
            //harpies chasing player
            // if ((player.fightx /*Factor for vOff and hOffHarpy OR use different player.x*/ < harpies[i].x)) {
            //     mgba_printf_level(MGBA_LOG_WARN, "%d is moving left", i);
            //     harpies[i].direction = LEFT;
            //     harpies[i].x -= harpies[i].dx;
            // } else if ((player.fightx > harpies[i].x)) {
            //     harpies[i].direction = RIGHT;
            //     harpies[i].x += harpies[i].dx;
            // } else if ((player.fighty < harpies[i].y)) {
            //     harpies[i].y -= harpies[i].dy;
            // } else if ((player.fighty > harpies[i].y)) {
            //     harpies[i].y += harpies[i].dy;
            // }

            // random movement

            // change direction 
            if ((harpies[i].x < 0) || (harpies[i].x > HMAPWIDTH - harpies[i].width)) harpies[i].dx *=-1;
            if ((harpies[i].y < 0) || (harpies[i].y > HMAPHEIGHT - harpies[i].height)) harpies[i].dy *=-1;
            harpies[i].x += harpies[i].dx;
            harpies[i].y += harpies[i].dy;
                
            }
    }
}