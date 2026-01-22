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

class FPogo extends FGameObject {
  
  int d; int frame;
  
  FPogo(int x, int y) {
    super();
    d = 1;
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
    animate();
    collision();
  }
  
  void animate() {
    if(frame >= pWalk.length) frame = 0;
    if(frameCount % 5 == 0) {
      if(d == -1)attachImage(pWalk[frame]);
      else attachImage(reverseImage(pWalk[frame]));
      frame++;
    }
  }
  
  void move() {
    float vy = getVelocityY();
    if(player.getX() > getX()) d = -1;
    else d = 1;
    ArrayList<FContact> contacts = getContacts();
    if(upKey && contacts.size() > 0 && dist(getX(),getY(), player.getX(),player.getY()) < 7*gridSize) vy = -500;
    if(dist(getX(),getY(), player.getX(),player.getY()) < 7*gridSize) setVelocity(-21*d,vy);
    else setVelocity(0,vy);
  }
  
  void collision() {
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

class FThwomp extends FGameObject {
  
  int d; boolean isStatic; boolean reset; int upness;
  boolean ready; boolean isResetting;
  
  FThwomp(int x, int y) {
    super();
    setWidth(gridSize*2);
    setHeight(gridSize*2);
    d = 1; isStatic = false; reset = false; upness = y*gridSize;
    ready = true; isResetting = false;
    setPosition(x*gridSize+gridSize/2,y*gridSize+gridSize/2);
    setName("thwomp");
    setGrabbable(false);
    setRotatable(false);
    setStatic(true);
    setFriction(5);
    setDensity(100);
    
    enemies.add(this);
    world.add(this);
  }
  
  void act() {
    move();
    animate();
  }
  
  void animate() {
    if(isStatic) attachImage(mad[0]);
    else attachImage(mad[1]);
  }
  
  void move() {
    ArrayList<FContact> contacts = getContacts();
  
    if (!ready && !isResetting && contacts.size() > 0) {
      setStatic(true); 
      isStatic = true;
      isResetting = true;
    }
    
    collision();
    
    if (isResetting) {
      ready = false;
      if (getY() <= upness) {
          setPosition(getX(), upness);
          setVelocity(0, 0);
          isResetting = false; 
          ready = true;
      } else {
          setPosition(getX(), getY() - 1);
      }
    }
    
    if (ready && dist(getX(), 0, player.getX(), 0) < gridSize * 2) {
      setStatic(false);
      isStatic = false;
      ready = false; 
      isResetting = false;
    }
  }
  
  void collision() {
    if(isTouching("player")) {
      player.bleh();
    }
  }
}
