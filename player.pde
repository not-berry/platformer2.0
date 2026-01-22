class FPlayer extends FGameObject {
  int x; int y; int frame; int direction;
  final int L = -1;
  final int R = 1;
  int t;
  FBox feet; FBox side;
  FPlayer(int _x, int _y) {
    super();
    x = _x; y = _y; frame = 0; direction = R; t = 0;
    setPosition(x*gridSize,y*gridSize);
    setName("player");
    
    //looks
    //setFillColor(cBlock);
    //setNoStroke();
    
    //properties
    setRestitution(.1);
    setDensity(50);
    setFriction(0);
    setGrabbable(false);
    setRotatable(false);
    
    //feet
    feet = new FBox(30, 5);
    feet.setRotatable(false);
    feet.setSensor(true);
    feet.setNoFill();
    feet.setNoStroke();
    world.add(feet);
    
    //side
    side = new FBox(38, 26);
    side.setRotatable(false);
    side.setSensor(true);
    side.setNoFill();
    side.setNoStroke();
    world.add(side);
    
    world.add(this);
  }
  
  void act() {
    input();
    collisions();
    animate();
    if(isTouching("portal")) world2();
  }
  
  void input() {
    feet();
    side();
    
    float vx = getVelocityX();
    float vy = getVelocityY();
    
    //idle
    if(abs(vy) < 1) action = idle;
    
    //side movement
    if(isTouchingFeet("dirt") || isTouchingFeet("bridge") || isTouchingFeet("side") || isTouchingFeet("leaves")) vx*=.85;
    if(leftKey && !rightKey) {
      if(vx >= -300) vx = -300;
      else vx += 50;
      action = run;
      direction = L;
      if(spacebar && t <= 0) {vx = -1000; t = 100;}
    }
    if(rightKey && !leftKey) {
      if(vx <= 300) vx = 300;
      else vx -= 50;
      action = run;
      direction = R;
      if(spacebar && t <= 0) {vx = 1000; t = 100;}
    }
    t--;
      
    //jump
    if(upKey) {
      if(isTouchingFeet("dirt") || isTouchingFeet("ice") || isTouchingFeet("leaves") || isTouching("bridge") || isTouchingFeet("ladder") || isTouchingFeet("side")) {
        vy = -400;
      }
    }
    if(abs(vy) > 5) {
      action = jump;
    }
    
    
    //apply
    player.setVelocity(vx,vy);
  }
  
  void collisions() {
    if(isTouching("spike")) {
      bleh();
    }
  }
  
  void animate() {
    if(frame >= action.length) frame = 0;
    if(frameCount % 5 == 0) {
      if(direction == R) attachImage(action[frame]);
      if(direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }
  
  void bleh() {
    if(lives <= 1) mode = "gameover";
    setVelocity(0,0);
    setPosition(spawnX,spawnY);
    lives--;
  }
  
  void world2() {
    world.clear();
    level = 2;
    loadWorld();
  }
  
  void feet() {
    feet.setPosition(getX(), getY()+23);
    feet.setVelocity(this.getVelocityX(), this.getVelocityY());
  }
  
  boolean isTouchingFeet(String n) {
    ArrayList<FContact> contacts = feet.getContacts();
    for(int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if(fc.contains(n)) return true;
    }
    return false;
  }
  
  void side() {
    side.setPosition(getX(), getY()-.5);
    side.setVelocity(this.getVelocityX(), this.getVelocityY());
  }
  
  boolean isTouchingSide(String n) {
    ArrayList<FContact> contacts = side.getContacts();
    for(int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if(fc.contains(n)) return true;
    }
    return false;
  }
}
