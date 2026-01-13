import fisica.*;
FWorld world;

//colours
color noStroke = #644949;
color noFill = #5F4444;
color white = #000000;
color black = #FFFFFF;

PImage map;
int gridSize = 64;

void setup() {
  size(1400, 1000);
  
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  map = loadImage("map.png");
  
  for(int x = 0; x < map.width; x++) {
    color c = map.get(x, 0);
    if(c == black) {
      FBox b = new FBox(gridSize, gridSize);
    }
  }
}

void draw() {
  world.step();
  world.draw();
}
