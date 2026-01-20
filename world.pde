void loadWorld() {
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 10000, 4000);
  world.setGravity(0, 900);
  map = loadImage("map.png");
  
  for(int y = 0; y < map.height; y++) {
    for(int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      if(c == cBlock) {
        dirt(x,y);
      } else if (c == cIce) {
        ice(x,y);
      } else if (c == cSpring) {
        spring(x,y);
      } else if (c == cSpike) {
        spike(x,y);
      } else if (c == cLeaves) {
        leaves(x,y);
      } else if (c == cTrunk) {
        trunk(x,y);
      } else if(c == cBridge) {
        //bridge(x,y);
        FBridge br = new FBridge(x,y);
      } else if(c == cSpawn) {
        player = new FPlayer(x,y);
      } else if (c == cGoomba) {
        FGoomba gmb = new FGoomba(x,y);
      }
    }
  }
}

void drawWorld() {
  pushMatrix();
  translate(width/2-player.getX()*zoom, height/2-player.getY()*zoom);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void actWorld() {
  player.act();
  for(int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  
  for(int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}
