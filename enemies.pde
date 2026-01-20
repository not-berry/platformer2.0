class FGoomba extends FGameObject {
  
  int d; int t; int frame;
  
  FGoomba(int x, int y) {
    super();
    d = 1; t = 0;
    setPosition(x*gridSize,y*gridSize);
    setName("goomba");
    setGrabbable(false);
    setRotatable(false);
    setFriction(0);
    
    enemies.add(this);
    world.add(this);
  }
  
  void act() {
    move();
    collide();
    animate();
  }
  
  void animate() {
    if(frame >= gWalk.length) frame = 0;
    if(frameCount % 25 == 0) {
      attachImage(gWalk[frame]);
      frame++;
    }
  }
  
  void move() {
    float vy = getVelocityY();
    setVelocity(21*d,vy);
    t--;
  }
  
  void collide() {
    if(isTouching("side") && t < 0) {
      d *= -1;
      t = 10;
    }
    
    if(isTouching("player")) {
      if(player.getY() < getY()-gridSize/2) {
        player.setVelocity(player.getVelocityX(), -300);
        world.remove(this);
        enemies.remove(this);
      } else {
        player.bleh();
      }
    }
  }
}
