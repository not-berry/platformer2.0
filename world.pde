void loadWorld() {
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 10000, 4000);
  world.setGravity(0, 900);
  map = loadImage("map.png");
  
  for(int y = 0; y < map.height; y++) {
    for(int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      if(c == black) {
        normBlock(x,y);
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
