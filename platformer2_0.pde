import fisica.*;
FWorld world;

//colours
color noStroke = #644949;
color noFill = #5F4444;
color background = #46C9F7;
color black = #000000;
color white = #FFFFFF;
color cBlock = #000000;
color cIce = #00A2E8;
color cSpring = #31FF6D;
color cSpike = #898AA4;
color cLeaves = #B5E61D;
color cTrunk = #B97A57;
color cBridge = #453333;
color cSpawn = #22B14C;
color cGoomba = #ED1C24;
color cSide = #C3C3C3;

//world
PImage map;
int gridSize = 32;
float zoom = 2;

//key variables
boolean upKey, leftKey, rightKey, downKey, spacebar;

//Fisica creations
FPlayer player;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;

void setup() {
  size(1400, 1000);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  
  loadTextures();
  
  loadWorld();
}

void draw() {
  background(background);
  drawWorld();
  actWorld();
}
