class Bullet {

  float x; float y;
  float dy;
  int radius;
  color ballColor = color(255,255,0);
  Bullet(float xpos, float ypos){
  x = xpos;
  y = ypos;
  dy = 2;
  radius=10;
}

void setStartLoc(float playerx, float playery){
  
  x=playerx;
  y=playery;
}

int collide(Alien[] myalien){
  
  int col=0;
  for(int i=0; i<myalien.length; i++){
    
    if(y+radius >= myalien[i].y &&
        y-radius<myalien[i].y+ invadery&&
        x >=myalien[i].x && x <=
        myalien[i].x+invaderx){
        
        col=1;
        }
}
 return col;
}

void move(){
  y = y-dy;
}
void draw(){
  
  fill(ballColor);
  ellipse(int(x), int(y), radius,
  radius);
  }
}
