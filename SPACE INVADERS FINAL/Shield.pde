class Shield{
  
  float xpos; float ypos;
  color paddlecolor = color(0,255,0);
  int health=1;
  
void move(){
  
  xpos=SCREENX/2-PADDLEWIDTH;
  ypos=SCREENY/1.5;
  
}
  
void draw()
{
fill(paddlecolor);
rect(xpos, ypos, PADDLEWIDTH+20, PADDLEHEIGHT);
}

int collide(Bullet someBullet, Bomb bomberMan){
  
      if(someBullet.y+someBullet.radius >= ypos &&
        someBullet.y-someBullet.radius<ypos+ PADDLEHEIGHT&&
        someBullet.x >=xpos && someBullet.x <=
        xpos+PADDLEWIDTH+20){
          
          someBullet.x=600;
          health=-1;
        }
        
        if(bomberMan.y+bomberMan.radius >= ypos &&
        bomberMan.y-bomberMan.radius<ypos+PADDLEHEIGHT &&
        bomberMan.x >=xpos && bomberMan.x <=
        xpos+PADDLEWIDTH+20){
          
          bomberMan.x=600;
          health=-1;
        }
        
  
  return health;
}
  
}
