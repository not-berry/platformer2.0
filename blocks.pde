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
  b.setRestitution(1.3);
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
