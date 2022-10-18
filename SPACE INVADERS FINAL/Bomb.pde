class Bomb {
  
  float x; float y;
  float dy;
  int radius;
  color bombColor = color(255,0,255);
  Bomb(float xpos, float ypos){
    
    x=xpos;
    y=ypos;
    dy=2;
    radius=13;
    
  }
  void move(){
    
    y=y+dy;
    
  }
  
  void draw() {
    
    fill(bombColor);
    ellipse(int(x), int(y), radius,radius);
    
  }
  
  boolean offScreen() {
    
    boolean notInFrame=false;
    if (y-radius>SCREENY){
      
      notInFrame=true;
    }
    return notInFrame;
    
  }
  
  boolean collide(Player aPlayer) {
    
    boolean collision=false;
    if(y+radius >= aPlayer.y() &&
    y-radius<aPlayer.y()+PADDLEHEIGHT &&
    x >=aPlayer.x() && x <=
    aPlayer.x()+PADDLEWIDTH){
      
      collision=true;
    }
    
    return collision;
  }
  
}
