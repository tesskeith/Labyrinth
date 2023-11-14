#include "game.h"
#include "fight1.h"
#include "fight2.h"
#include "fight3.h"
#include "sound.h"
#include "walk.h"
// include collsion map
#include "collisionmap.h"
#include "collisionmap2.h"

#include "collide.h"

inline unsigned char colorAt(int x, int y);



int healthCountdown;
unsigned char* collisionMap;
int collisionsEnabled;

int newArrow;
SPRITE arrows[ARROWCOUNT];


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
    for(int i = 0; i < ARROWCOUNT; i++) {
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
    //swap tiles if passed both fight states
    if(passed2) {
         // remove exit block
    
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 5; j++) {
                //  using SCREENBLOCK 31 and the tile we want to replace the tree with is tileID 66
                SCREENBLOCK[28].tilemap[OFFSET(25 + i, 12 + j,32)] = 66;
            }
        }

        // // Activity 1.1: Change the collision map to let the player move through the tree thing
        collisionMap = (unsigned char*) collisionmap2Bitmap;
        // //tried using malloc
        // for (int i = 0; i < 32; i++) {
        //     for (int j = 0; j < 40; j++) {
        //         // Top left of the tree thingy is (112, 88) and it's 32x32px
        //         collisionMap[OFFSET(200 + i,88 + j, MAPWIDTH)] = 3*7;
        //     }
        // }
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
    //mgba_printf("Position: (%d, %d)", player.x, player.y);
}

void drawGame() {

    // Draw sprites
    drawPlayer();
    drawHealth();
    drawArrows();
    // Set camera offset 
    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;
    REG_BG1HOFF = hOff*2;
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

}

void drawPlayer() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;

    } else {

        //Change where player is drawn based on camera position
        shadowOAM[0].attr0 = ATTR0_Y(player.y - vOff) | ATTR0_TALL;
        shadowOAM[0].attr1 = ATTR1_X(player.x - hOff) | ATTR1_MEDIUM;

        // Update ATTR2_TILEID to use direction and frame
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3*player.direction, 5*player.frame);

    }
}

// check collsions map color
inline unsigned char colorAt(int x, int y){
    if(fightingSkeletons) {
        return collisionMap[OFFSET(x,y,256)];
    }
    return collisionMap[OFFSET(x,y,MAPWIDTH)]; 

}

// check if can move left according to collsion map colors
int canMoveLeft(SPRITE *sprite, int x, int y) {

    if (!collisionsEnabled) return 1;

    int left = x;
    int top = y;
    int bottom =y + sprite->height -1;
    return colorAt(left - sprite->dx,top ) && colorAt(left - sprite->dx,bottom );

}

// check if can move right according to collsion map colors
int canMoveRight(SPRITE *sprite,int x, int y) {

    if (!collisionsEnabled) return 1;

    int right = x + sprite->width -1;
    int top = y;
    int bottom =y + sprite->height -1;

    return colorAt(right +sprite->dx,top ) && colorAt(right + sprite->dx,bottom);

}

// check if can move up according to collsion map colors
int canMoveUp(SPRITE *sprite, int x, int y) {

    if (!collisionsEnabled) return 1;

    int left = x;
    int right = x + sprite->width -1;
    int top = y;
    
    return colorAt(left,top - sprite->dy) && colorAt(right,top - sprite->dy);

}


// check if can move down according to collsion map colors
int canMoveDown(SPRITE *sprite, int x, int y) {

    if (!collisionsEnabled) return 1;

    int left = x;
    int right = x + sprite->width -1;
    int bottom = y + sprite->height -1;
    //mgba_printf("bottom left/right: (%d, %d)",colorAt(left,bottom + sprite->dy),colorAt(right,bottom + sprite->dy));
    return colorAt(left,bottom + sprite->dy) && colorAt(right,bottom + sprite->dy);

}
// check if can move right according to collsion map colors
int enemyCanMove(SPRITE *sprite) {

    if (!collisionsEnabled) return 1;

    int lateral = sprite->x + sprite->dx;
    int vertical = sprite->y + sprite->dy;
    return colorAt(lateral,vertical );

}

void shootArrow(int cheat) {
    newArrow = newArrow % 5;
    arrows[newArrow].direction = player.direction;
    //make arrow shoot from middle of player based on direction
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
                arrows[newArrow].y = SHIFTDOWN(player.fighty);
            } else {
                arrows[newArrow].y = player.fighty;
            }
        arrows[newArrow].x = player.fightx;
        
        //mgba_printf("Position of new arrows: (%d, %d)", arrows[newArrow].x, arrows[newArrow].y);    
    } else { 
        arrows[newArrow].cheat = 0;
     if(arrows[newArrow].direction == RIGHT || arrows[newArrow].direction == LEFT) {
        arrows[newArrow].width = 32;
        arrows[newArrow].height = 8;
        arrows[newArrow].x = player.fightx;
            if(fightingMinotaur) {
                arrows[newArrow].y = SHIFTDOWN(player.fighty) + 16;
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
    
    for(int i = 0; i < ARROWCOUNT; i++) {
        if(fightingMinotaur) {
            xpos = arrows[i].x ;
            ypos = arrows[i].y;
        } else if(fightingSkeletons) {
            xpos = arrows[i].x - hOffSkeleton;
            ypos = arrows[i].y - vOffSkeleton;
        }
        if (arrows[i].hide) {
            shadowOAM[(7 + i)].attr0 |= ATTR0_HIDE;
        } else {
            if (arrows[i].cheat) {
                shadowOAM[(7 + i)].attr0 = ATTR0_Y(ypos) | ATTR0_SQUARE;
                shadowOAM[(7 + i)].attr1 = ATTR1_X(xpos) | ATTR1_MEDIUM;

                shadowOAM[(7 + i)].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0,4*arrows[i].frame);
            } else if(arrows[i].direction == RIGHT || arrows[i].direction == LEFT) {
                shadowOAM[(7 + i)].attr0 = ATTR0_Y(ypos) | ATTR0_WIDE;
                shadowOAM[(7 + i)].attr1 = ATTR1_X(xpos) | ATTR1_SMALL;

                shadowOAM[(7 + i)].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9,4*arrows[i].direction);
            } else {
                shadowOAM[(7 + i)].attr0 = ATTR0_Y(ypos) | ATTR0_TALL;
                shadowOAM[(7 + i)].attr1 = ATTR1_X(xpos) | ATTR1_SMALL;

                shadowOAM[(7 + i)].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9,4*arrows[i].direction);
            }

            

        }
    }
}


void checkArrowCollision(SPRITE *sprite) {
    //check arrow collision with sprite
    for(int i = 0; i < ARROWCOUNT; i++) {
        if(!arrows[i].hide) {
            //exit fight if arrow hits sprite
            if(collision(arrows[i].x, arrows[i].y, arrows[i].width, arrows[i].height, sprite->x, sprite->y, sprite->width, sprite->height)) {
                if(arrows[i].cheat) {
                    sprite->health == 0;
                } else {
                    sprite->health -=5;
                }
                if((sprite->health < 1) || arrows[i].cheat){
                    if(fightingMinotaur) {
                        //mgba_printf(" cheat working");
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

// make arrows move
void moveArrows() {
    for(int i = 0; i< ARROWCOUNT; i++) {
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


            // hide once off screen
            if(fightingMinotaur) {
                if ((arrows[i].x < 0) || (arrows[i].x > SCREENWIDTH - arrows[i].width)){
                //mgba_printf("Position: (%d, %d)", arrows[newArrow].x, arrows[newArrow].y);     
                arrows[i].hide = 1;
                arrows[i].active = 0;
            } 
            if ((arrows[i].y < 0) || (arrows[i].y > SCREENHEIGHT - arrows[i].height)){
                arrows[i].hide = 1;
                arrows[i].active = 0;
            }   
            } else if (fightingSkeletons) {
                 if (((arrows[i].x - hOffSkeleton) < 0) || (arrows[i].x - hOffSkeleton > SCREENWIDTH - arrows[i].width)){
                arrows[i].hide = 1;
                arrows[i].active = 0;
            } 
            if (((arrows[i].y  - vOffSkeleton ) < 0) || (arrows[i].y  - vOffSkeleton > SCREENHEIGHT - arrows[i].height)){
                arrows[i].hide = 1;
                arrows[i].active = 0;
            }   
            }
             
        }
    }
}


void movePlayer() {
    // movement in fight state
     if(mapState) {
        // movement through map
        if (BUTTON_HELD(BUTTON_LEFT) && canMoveLeft(&player, player.x,player.y)) {
            //mgba_printf("move player  using left/right reached");
            player.x -= player.dx;
        } else if (BUTTON_HELD(BUTTON_RIGHT) && canMoveRight(&player, player.x,player.y)) {
            player.x += player.dx;
        } else if (BUTTON_HELD(BUTTON_UP) && canMoveUp(&player, player.x,player.y)) {
            player.y -= player.dy;
        } else if (BUTTON_HELD(BUTTON_DOWN) && canMoveDown(&player, player.x,player.y)) {
            //mgba_printf("move down : (%d, %d)",player.x,player.y);
            player.y += player.dy;
        }
            
        if(collisionsEnabled) {
            //Set camera position based on new player position
        hOff = player.x -(SCREENWIDTH - player.width) / 2;
        vOff = player.y -(SCREENHEIGHT - player.height) / 2;

        //  Restrict player movement to map
        if (player.x < 0) player.x = 0;
        if (player.y < 0) player.y = 0;
        if (player.x > MAPWIDTH - player.width) player.x = MAPWIDTH - player.width;
        if (player.y > MAPHEIGHT - player.height) player.y = MAPHEIGHT - player.height;

        // Complex Movement Activity 3.1: Restrict camera movement to map
        if (hOff < 0) hOff = 0;
        if (vOff < 0) vOff = 0;
        if (hOff > MAPWIDTH - SCREENWIDTH) hOff = MAPWIDTH - SCREENWIDTH;
        if (vOff > MAPHEIGHT - SCREENHEIGHT) vOff = MAPHEIGHT - SCREENHEIGHT;
        } 
    }
}


void animatePlayer(SPRITE *sprite) {
    // Animating Sprites Activity 3.0 and 4.0: Update currentFrame correctly
       sprite->isMoving = 0;
    //  Update isMoving and direction in each conditional
    if (BUTTON_HELD(BUTTON_UP)) {
        sprite->isMoving = 1;
        sprite->direction = UP;
    }

    if (BUTTON_HELD(BUTTON_DOWN)) {
        sprite->isMoving = 1;
        sprite->direction = DOWN;
    }

    if (BUTTON_HELD(BUTTON_LEFT)) {
        sprite->isMoving = 1;
        sprite->direction = LEFT;
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        sprite->isMoving = 1;
        sprite->direction = RIGHT;
    }

    // Update frame number correctly
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
    //  Update isMoving and direction in each conditional

        sprite->timeUntilNextFrame--;
        if(sprite->timeUntilNextFrame == 0) {
            sprite->timeUntilNextFrame = 10;
            sprite->frame = (sprite->frame + 1) % sprite->numOfFrames;
        } 
}


void drawHealth(){
    //  word health: displayed top right
    shadowOAM[10].attr0 = ATTR0_Y(10) | ATTR0_WIDE;
    shadowOAM[10].attr1 = ATTR1_X(136) | ATTR1_SMALL;
    shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(10, 31);
    shadowOAM[11].attr0 = ATTR0_Y(10) | ATTR0_WIDE;
    shadowOAM[11].attr1 = ATTR1_X(168) | ATTR1_SMALL;
    shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 31);
    // get health value to display on screen
    int ones = player.health % 10;
    int tens = player.health / 10 % 10;
    int hundreds = player.health / 100 % 10;
    //copy player.health values into shadowOAM places 12-14 and percent symbol into 15
    for (int i = 0; i<4; i++) {
        shadowOAM[12 + i].attr0 = ATTR0_Y(10) | ATTR0_SQUARE;
        shadowOAM[12 + i].attr1 = ATTR1_X(200 + (i*8)) | ATTR1_TINY;
    }
    //display empty tile if no hundreds place value
    if(player.health < 100) {
        hundreds = 20;
    }
    shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(hundreds, 31);
    shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(tens, 31);
    shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(ones, 31);
    shadowOAM[15].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(18, 31);


}

void updateHealth(){
    healthCountdown--;
    if(healthCountdown == 0){
        player.health--;
        healthCountdown = 200;
    }
}