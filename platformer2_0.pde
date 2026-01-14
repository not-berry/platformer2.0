import fisica.*;
FWorld world;

//colours
color noStroke = #644949;
color noFill = #5F4444;
color white = #FFFFFF;
color black = #000000;

//world
PImage map;
int gridSize = 64;
float zoom = 0.7;

//key variables
boolean upKey, leftKey, rightKey, downKey, spacebar;

//Fisica creations
FPlayer player;

void setup() {
  size(1400, 1000);
  
  loadWorld();
  loadPlayer();
}

void draw() {
  background(white);
  drawWorld();
  player.act();
}
