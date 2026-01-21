import fisica.*;
FWorld world;
String mode = "intro";
int level = 1;
int lives = 3;

//colours
color noStroke = #644949;
color noFill = #5F4444;
color gBackground = #46C9F7;
color iBackground = #1C1C1C;
color red = #E32E2E;
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
color cLava = #FF7F27;
color cCheckpoint = #ABFFB6;
color cPortal = #A349A4;
color cPogo = #A40003;
color cSign = #EFE4B0;
color cLadder = #FFC90E;
color cSwitch = #5F00E7;
color cThwomp = #E8A5DF;

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

//spawn
int spawnX;
int spawnY;

//font
PFont f;

//buttons
Button[] myButtons;
boolean mouseReleased = false;
boolean wasPressed = false;

void setup() {
  size(1400, 1000);
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();
  
  loadTextures();
  
  loadWorld();
  
  //font
  f = createFont("font.ttf", 150);
  textFont(f);
  
  //buttons
  myButtons = new Button[2];
  myButtons[0] = new Button(white,black, white, width/2,height-200, 200,100, 10, 5, "PLAY", 75, false, "plus.jpg");
  myButtons[1] = new Button(white,black, white, width/2,height-200, 460,100, 10, 5, "CONTINUE?", 75, false, "plus.jpg");
}

void draw() {
  if(mode == "game") {
    game();
  } else if(mode == "intro") {
    intro();
  } else if(mode == "gameover") {
    gameover();
  } else if(mode == "pause") {
    pause();
  }
  click();
}
