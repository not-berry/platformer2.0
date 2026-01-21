class FPlayer extends FGameObject {
  int x; int y; int frame; int direction;
  final int L = -1;
  final int R = 1;
  FPlayer(int _x, int _y) {
    super();
    x = _x; y = _y; frame = 0; direction = R;
    setPosition(x*gridSize,y*gridSize);
    setName("player");
    
    //looks
    //setFillColor(cBlock);
    //setNoStroke();
    
    //properties
    setRestitution(.1);
    setDensity(50);
    setFriction(2);
    setGrabbable(false);
    setRotatable(false);
    
    world.add(this);
  }
  
  void act() {
    input();
    collisions();
    animate();
    if(isTouching("portal")) world2();
  }
  
  void input() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    
    //idle
    if(abs(vy) < 1) action = idle;
    
    //side movement
    if(leftKey && !rightKey) {
      vx = -300;
      action = run;
      direction = L;
    }
    if(rightKey && !leftKey) {
      vx = 300;
      action = run;
      direction = R;
    }
  
    //jump
    ArrayList<FContact> contacts = player.getContacts();
    if(upKey && contacts.size() > 0) vy = -400;
    if(abs(vy) > 10) action = jump;
    
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
}
