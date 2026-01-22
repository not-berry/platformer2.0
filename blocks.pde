class FBridge extends FGameObject {
  
  FBridge(int x, int y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    setName("bridge");
  
    //looks
    if(map.get(x-1, y) == cBridge && map.get(x+1, y) == cBridge) attachImage(bridge_center);
    else if(map.get(x-1, y) != cBridge) attachImage(bridge_left);
    else attachImage(bridge_right);
  
    //properties
    //b.setFriction(-2);
    //b.setRestitution(1.3);
    setGrabbable(false);
    setStatic(true);
    
    terrain.add(this);
    world.add(this);
  }
  
  void act() {
    if(isTouching("player")) {
      setStatic(false);
    }
  }
}

class FLava extends FGameObject {
  
  int frame;
  
  FLava(int x, int y) {
    super();
    setPosition(x*gridSize,y*gridSize);
    setName("lava");
    
    frame = 0;
    
    setStroke(#750000);
    setFill(#750000);
    
    setGrabbable(false);
    setStatic(true);
    setSensor(true);
    
    terrain.add(this);
    world.add(this);
  }
  
  void act() {
    if(isTouching("player")) player.bleh();
    
    animate();
  }
  
  void animate() {
    if(map.get((int)getX()/gridSize, (int)getY()/gridSize-1) != cLava) {
      if(frame >= lavaPop.length) frame = 0;
      if(frameCount % 10 == 0) {
        attachImage(lavaPop[frame]);
        frame++;
      }
    }
    setStrokeColor(#750000);
    setFillColor(#750000);
  }
}

class FSpawn extends FGameObject {
  
  
  
  FSpawn(int x, int y) {
    super();
    
    setPosition(x*gridSize,y*gridSize);
    setName("spawn");
    
    setStroke(105,222,83, 150);
    setFill(105,222,83, 150);
    
    setGrabbable(false);
    setStatic(true);
    setSensor(true);
    
    terrain.add(this);
    world.add(this);
  }
  
  void act() {
    if(isTouching("player")) {
      world.remove(this);
      terrain.remove(this);
      spawnX = (int)getX();
      spawnY = (int)getY();
    }
  }
}

void dirt(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  b.setName("dirt");
  if(map.get(x, y-1) == cSide) b.setName("side");
  
  //looks
  if (map.get(x-1, y) == cBlock && map.get(x+1, y) == cBlock && map.get(x, y-1) != cBlock) b.attachImage(dirt_n);
  else if(map.get(x, y+1) == cBlock && map.get(x, y-1) == cBlock && map.get(x+1, y) != cBlock) b.attachImage(dirt_e);
  else if(map.get(x, y-1) == cBlock && map.get(x, y+1) == cBlock && map.get(x-1, y) != cBlock) b.attachImage(dirt_w);
  else if(map.get(x-1, y) == cBlock && map.get(x+1, y) == cBlock && map.get(x, y+1) != cBlock) b.attachImage(dirt_s);
  else if(map.get(x-1, y) != cBlock && map.get(x, y-1) != cBlock) b.attachImage(dirt_nw);
  else if(map.get(x+1, y) != cBlock && map.get(x, y-1) != cBlock) b.attachImage(dirt_ne);
  else if(map.get(x, y+1) != cBlock && map.get(x-1, y) != cBlock) b.attachImage(dirt_sw);
  else if(map.get(x, y+1) != cBlock && map.get(x+1, y) != cBlock) b.attachImage(dirt_se);
  else b.attachImage(dirt_center);
  
  
  //properties
  b.setFriction(0.5);
  b.setGrabbable(false);
  b.setStatic(true);
  
  world.add(b);
}

void spring(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  b.attachImage(spring);
  
  //properties
  b.setRestitution(1.25);
  b.setGrabbable(false);
  b.setStatic(true);
  
  b.setName("spring");
  world.add(b);
}

void spike(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  b.attachImage(spike);
  
  //properties
  b.setRestitution(1.1);
  b.setGrabbable(false);
  b.setStatic(true);
  
  b.setName("spike");
  world.add(b);
}

void leaves(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  if(map.get(x-1, y) == cLeaves && map.get(x+1, y) == cLeaves && map.get(x, y+1) != cTrunk) b.attachImage(leaves_main);
  else if(map.get(x-1, y) != cLeaves && map.get(x+1, y) == cLeaves) b.attachImage(leaves_right);
  else if(map.get(x-1, y) == cLeaves && map.get(x+1, y) != cLeaves) b.attachImage(leaves_left);
  else b.attachImage(leaves_connect);
  
  //properties
  b.setFriction(5);
  b.setGrabbable(false);
  b.setStatic(true);
  
  b.setName("leaves");
  world.add(b);
}

void trunk(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  b.attachImage(trunk);
  
  //properties
  b.setGrabbable(false);
  b.setStatic(true);
  b.setSensor(true);
  
  b.setName("trunk");
  world.add(b);
}

void ice(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  b.attachImage(ice);
  
  //properties
  b.setFriction(-2);
  //b.setRestitution(1.3);
  b.setGrabbable(false);
  b.setStatic(true);
  
  b.setName("ice");
  world.add(b);
}

void bridge(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  if(map.get(x-1, y) == cBridge && map.get(x+1, y) == cBridge) b.attachImage(bridge_center);
  else if(map.get(x-1, y) != cBridge) b.attachImage(bridge_left);
  else b.attachImage(bridge_right);
  
  //properties
  //b.setFriction(-2);
  //b.setRestitution(1.3);
  b.setGrabbable(false);
  b.setStatic(true);
  
  b.setName("bridge");
  world.add(b);
}

void portal(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize,y*gridSize);
  b.setName("portal");
  
  b.setStroke(105,222,83, 150);
  b.setFill(105,222,83, 150);
  
  b.setGrabbable(false);
  b.setStatic(true);
  b.setSensor(true);
  
  world.add(b);
}

class FSign extends FGameObject {
  
  
  
  FSign(int x, int y) {
    super();
    setPosition(x*gridSize, y*gridSize);
    setName("sign");
    attachImage(sign);
    setGrabbable(false);
    setStatic(true);
    setSensor(true);
    
    terrain.add(this);
    world.add(this);
  }
  
  void act() {
    if(isTouching("player")) {
      if(map.get((int)getX()/gridSize,((int)getY()-1)/gridSize) == #EBE0AD) showSign("This game isn't Mario.\nI dont pirate.");
      else if(map.get((int)getX()/gridSize,((int)getY()-1)/gridSize) == #EDE2AF) showSign("Mario is on controller\nwhile this game is not.");
      else if(map.get((int)getX()/gridSize,((int)getY()-1)/gridSize) == #F0E5B1) showSign("dying is a skill issue\n:(          (not lag)");
      else if(map.get((int)getX()/gridSize,((int)getY()-1)/gridSize) == #DED4A3) showSign("Riddle: when is L \ngreater than XL?");
      else if(map.get((int)getX()/gridSize,((int)getY()-1)/gridSize) == #DBD1A1) showSign("THE END\nBYE BYE NOW");
    }
  }
  
  void showSign(String s) {
    rectMode(LEFT);
    noStroke();
    fill(white, 100);
    rect(40,50, width-40,225);
    
    textAlign(LEFT, TOP);
    textSize(100);
    fill(white);
    text(s, 50,60);
  }
}

class FSwitch extends FGameObject {
  
  int switched; int t;
  
  FSwitch(int x, int y) {
    super();
    switched = -1; t = 0;
    setPosition(x*gridSize, y*gridSize);
    setName("switch");
    
    setFill(255,54,57, 150);
    setStroke(255,54,57, 150);
    
    setGrabbable(false);
    setStatic(true);
    setSensor(true);
    
    terrain.add(this);
    world.add(this);
  }
  
  void act() {
    if(switched == 1) { setFill(87,255,54, 150); setStroke(87,255,54, 150); world.setGravity(0, 450);}
    else { setFill(255,54,57, 150); setStroke(255,54,57, 150); world.setGravity(0, 900);}
    
    if(isTouching("player") && t <= 0) { switched *= -1; t = 50;}
    t--;
  }
}

void ladder(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize,y*gridSize);
  b.setName("ladder");
  
  b.attachImage(ladder);
  
  b.setGrabbable(false);
  b.setStatic(true);
  b.setSensor(true);
  
  world.add(b);
}
