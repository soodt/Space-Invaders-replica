class Alien {
int x, y, direction;
int status;
boolean bomby=false;
PImage normalImg, explodeImg;
Bomb ownBomb;
Alien (int xpos, int ypos, PImage okImg, PImage exImg, Bomb daBomb){
x = xpos;
y = ypos;
status = ALIEN_ALIVE;
normalImg=okImg;
explodeImg=exImg;
direction=FORWARD;
ownBomb=daBomb;
}

void move(){
if (direction==FORWARD){
if(x+normalImg.width<SCREENX-1)
x++;
else{
direction=BACKWARD;
y+=normalImg.height+GAP;
}
}
else if(x>0) x--;
else {
direction=FORWARD;
y+=normalImg.height+GAP;
}

if(status==ALIEN_ALIVE){

if(random(0, 1000)<1){
  if (ownBomb.offScreen()==false){
    bomby=true;
  }
}

if (bomby){
  ownBomb.move();
  ownBomb.draw();
  
}


if (bomby==false){
   ownBomb.x=x+invaderx/2;
   ownBomb.y=y+invadery+7;
}

if (ownBomb.offScreen()==true){
  bomby=false;
}
}
}
void draw(){
if(status==ALIEN_ALIVE)
image(normalImg, x, y);
else if(status!=ALIEN_DEAD){
image(explodeImg, x, y);
status++;
}
// otherwise dead, don't draw anything
}
void die(){
if(status==ALIEN_ALIVE){
status++;
deadAliens+=1;
}
}
}
