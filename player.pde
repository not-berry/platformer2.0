class FPlayer extends FBox {
  
  FPlayer() {
    super(gridSize, gridSize);
    setPosition(300,0);
    
    //looks
    setFillColor(black);
    
    //properties
    setGrabbable(false);
    setRotatable(false);
  }
  
  void act() {
  float vx = player.getVelocityX();
  float vy = player.getVelocityY();
  
  //side movement
  if(leftKey && !rightKey) vx = -600;
  if(rightKey && !leftKey) vx = 600;
  
  //slow down
  if(!leftKey && !rightKey || leftKey && rightKey) vx *= 0.9;
  if(vx < 10 && vx > -10) vx = 0;
  
  //jump
  ArrayList<FContact> contacts = player.getContacts();
  if(upKey && contacts.size() > 0) vy = -500;
  if(vy > 0) vy *= 1.01;
  
  //apply
  player.setVelocity(vx,vy);
  }
}

void loadPlayer() {
  player = new FPlayer();
  world.add(player);
}
