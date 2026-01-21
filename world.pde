void loadWorld() {
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 10000, 4000);
  world.setGravity(0, 900);
  if(level == 1) map = loadImage("map.png");
  else if(level == 2) map = loadImage("map2.png");
  
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
        FBridge br = new FBridge(x,y);
      } else if(c == cSpawn) {
        player = new FPlayer(x,y);
        spawnX = x*gridSize;
        spawnY = y*gridSize;
      } else if (c == cGoomba) {
        FGoomba gmb = new FGoomba(x,y);
      } else if (c == cLava) {
        FLava lva = new FLava(x,y);
      } else if (c == cCheckpoint) {
        FSpawn spn = new FSpawn(x,y);
      } else if(c == cPortal) {
        portal(x,y);
      } else if(c == cPogo) {
        FPogo pgo = new FPogo(x,y);
      } else if(c == cSign) {
        FSign sgn = new FSign(x,y);
      } else if(c == cLadder) {
        ladder(x,y);
      } else if(c == cSwitch) {
        FSwitch swt = new FSwitch(x,y);
      } else if( c == cThwomp) {
        FThwomp tmp = new FThwomp(x,y);
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
  
  if(player.getY() > 1500) player.bleh();
}
