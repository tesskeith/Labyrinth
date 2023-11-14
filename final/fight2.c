#include "fight2.h"
#include "collide.h"
#include "sound.h"



//int win = 0;
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
    
    // SPRITEPALETTE[2] = GREEN;
    // SPRITEPALETTE[8] = CYAN;
    player.direction = RIGHT;
    //initPlayer();
    initMinotaur();

}
void drawFight2() {

    // Draw sprites
    drawPlayerFightingMinotaur();
    drawMinotaur();
    drawArrows();
    drawHealth();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

}

void drawPlayerFightingMinotaur() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;

    } else {

        //Change where player is drawn based on camera position
        shadowOAM[0].attr0 = ATTR0_Y(SHIFTDOWN(player.fighty)) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = ATTR1_X(player.fightx) | ATTR1_MEDIUM;

        // Update ATTR2_TILEID to use direction and frame
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 5*player.direction);

    }
}

void updateFight2() {
    if (BUTTON_HELD(BUTTON_RSHOULDER)){
        shootArrow(0);
        newArrow++;
        
    }
    //use cheat
    if(BUTTON_PRESSED(BUTTON_LSHOULDER)) {
       shootArrow(1);
       newArrow++;
    }
     for(int i = 0; i < ARROWCOUNT; i++) {
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
            shadowOAM[6].attr0 |= ATTR0_HIDE;
        } else {

            shadowOAM[6].attr0 = ATTR0_Y(minotaur.y ) | ATTR0_SQUARE;
            shadowOAM[6].attr1 = ATTR1_X(minotaur.x ) | ATTR1_LARGE;

        // Update ATTR2_TILEID to use direction and currentFrame
            shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID( 8*minotaur.direction, 8*minotaur.frame);

    }
}



void checkCollision2() {
    
    //check monster collisions 
    if(!minotaur.hide) {
        if(collision(player.fightx, SHIFTDOWN(player.fighty), player.width, player.height, minotaur.x + 10,minotaur.y + 10,minotaur.width - 20,minotaur.height - 20)) {
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
    // int rightBorder = SCREENWIDTH - player.width;
    // int bottomBorder = SCREENHEIGHT - player.height;

    int canJump = 0;

    //  acceleration due to gravity to update the player's dy
    jump += GRAVITY;

    // checking the player's position to see if player is GROUNDED
    // if so, set dy to 0, and allow the player to jump again!
    if (SHIFTDOWN(player.fighty +jump) > (SCREENHEIGHT - FLOORHEIGHT)) {
       jump = 0;
        canJump = 1; // allows player to jump again
    }

    // update the player's y position
    player.fighty +=jump;
    
    if (BUTTON_PRESSED(BUTTON_UP) && canJump) {
        // update dy with initial jump velocity
       jump -= JUMPVELOCITY;

    } 

    if (BUTTON_HELD(BUTTON_LEFT)
        && player.fightx > 0 ) {
            
            player.fightx -= player.dx;
            player.direction = LEFT;
        }

    if (BUTTON_HELD(BUTTON_RIGHT)
        && player.fightx + player.width < SCREENWIDTH) {
            player.fightx += player.dx;
            player.direction = RIGHT;
        } 

}

void moveMinotaur() {
    // movement right/left on floor
    if ((minotaur.x < 0) || (minotaur.x > SCREENWIDTH - minotaur.width )) minotaur.dx *=-1;
        minotaur.x += minotaur.dx;
    // change animation direction
        if(minotaur.dx > 1) {
            minotaur.direction = RIGHT;
        } else{
            minotaur.direction = LEFT;
        }
}



void exitFight2() {
        for(int i = 0; i < ARROWCOUNT; i++) {
            arrows[i].hide = 1;
        }
        minotaur.hide = 1;
        passed2 = 1;
        mapState = 1;
        SPRITEPALETTE[2] = BLUE2;
        SPRITEPALETTE[8] = BLUE8;
        fightingMinotaur = 0;
        collisionsEnabled = 1;
        goToGame();
}
