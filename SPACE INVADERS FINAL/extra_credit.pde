Alien theAliens[];
Player thePlayer;
Shield AoShield;
ArrayList<Bullet> theBullet;
PFont myFont;
boolean shoot=false;
boolean bomber=false;
int c=0;
int health=10;
int negative=0;
void settings(){
  size(SCREENX,SCREENY);
}
void setup(){
PImage normalImg, explodeImg;
thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
normalImg= loadImage("invader.gif");
explodeImg = loadImage("exploding.gif");
theAliens = new Alien[10];
init_aliens(theAliens,normalImg, explodeImg);
theBullet= new ArrayList();
AoShield=new Shield();
}
void init_aliens(Alien baddies[], PImage okImg, PImage
exImg){
for(int i=0; i<baddies.length; i++){
// This is buggy, what is the problem?
baddies[i] = new Alien(i*(okImg.width+GAP), 0, okImg,
exImg, new Bomb(50,200));
}
}

void init_bullets(ArrayList<Bullet> Bullets, float x, float y){
  
    Bullets.add(new Bullet(x,y));
    
}

void mouseReleased(){
  init_bullets(theBullet,thePlayer.xpos+PADDLEWIDTH/2, thePlayer.ypos);
}


void draw(){
background(0);
if (deadAliens!=10){
for(int r=0; r<theAliens.length; r++){
  if (theAliens[r].ownBomb.collide(thePlayer)==true){ //<>//
    bomber=true;
  }
}
if (bomber==false){
thePlayer.move(mouseX);
thePlayer.draw();
for (int i=0; i<theBullet.size(); i++){
//theBullet.get(i).setStartLoc(thePlayer.xpos+PADDLEWIDTH/2,thePlayer.ypos);
theBullet.get(i).draw();
theBullet.get(i).move();
c=theBullet.get(i).collide(theAliens);
 }
for(int i=0; i<theAliens.length; i++){
theAliens[i].move();
theAliens[i].draw();
}
for(int i=0; i<theAliens.length; i++){
    for (int a=0; a<theBullet.size(); a++){
    if(theBullet.get(a).y+theBullet.get(a).radius >= theAliens[i].y &&
        theBullet.get(a).y-theBullet.get(a).radius<theAliens[i].y+ invadery&&
         theBullet.get(a).x >=theAliens[i].x &&  theBullet.get(a).x <=
        theAliens[i].x+invaderx){
        theAliens[i].die();
        
}
    }
}
}
myFont=loadFont("Arial-BoldMT-25.vlw");
textFont(myFont);
fill(255,0,0);
if (bomber==true){
//if (theAliens[r].ownBomb.collide(thePlayer)==true){
text("GAME OVER!", SCREENX/3,SCREENY/2); 
}
for(int i=0; i<theAliens.length; i++){
  for (int a=0; a<theBullet.size(); a++){
if (AoShield.collide(theBullet.get(a),theAliens[i].ownBomb)>=0){
AoShield.draw();
AoShield.move();
}
}
}
}
if (deadAliens==10){
  textFont(myFont);
  fill(255,0,0);
  text("YOU WIN!", SCREENX/3,SCREENY/2); 
  
}

}
