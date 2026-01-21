//blocks
PImage brick;
PImage dirt_n;
PImage dirt_center;
PImage dirt_e;
PImage dirt_w;
PImage dirt_s;
PImage dirt_ne;
PImage dirt_nw;
PImage dirt_se;
PImage dirt_sw;
PImage ice;
PImage spring;
PImage spike;
PImage leaves_connect;
PImage leaves_main;
PImage leaves_left;
PImage leaves_right;
PImage trunk;
PImage bridge_center;
PImage bridge_left;
PImage bridge_right;
PImage sign;
PImage ladder;

//player animations
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] action;

//GOOMBA
PImage[] gWalk;

//lava
PImage[] lavaPop;

//pogo
PImage[] pWalk;

//thwomp
PImage[] mad;


void loadTextures() {
  brick = loadImage("brick.png");
  dirt_n = loadImage("dirt_n.png");
  dirt_center = loadImage("dirt_center.png");
  dirt_e = loadImage("dirt_e.png");
  dirt_w = loadImage("dirt_w.png");
  dirt_s = loadImage("dirt_s.png");
  dirt_ne = loadImage("dirt_ne.png");
  dirt_nw = loadImage("dirt_nw.png");
  dirt_se = loadImage("dirt_se.png");
  dirt_sw = loadImage("dirt_sw.png");
  ice = loadImage("ice.png");
  spring = loadImage("spring.png");
  spike = loadImage("spike.png");
  leaves_main = loadImage("leaves_main.png");
  leaves_connect = loadImage("leaves_connect.png");
  leaves_left = loadImage("leaves_left.png");
  leaves_right = loadImage("leaves_right.png");
  trunk = loadImage("trunk.png");
  bridge_center = loadImage("bridge_center.png");
  bridge_left = loadImage("bridge_left.png");
  bridge_right = loadImage("bridge_right.png");
  sign = loadImage("sign.png");
  ladder = loadImage("ladder.png");
  
  //load actions
  idle = new PImage[2];
  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");
  
  jump = new PImage[1];
  jump[0] = loadImage("jump0.png");
  
  run = new PImage[3];
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");
  
  action = idle;
  
  
  //GOOMBA
  gWalk = new PImage[2];
  gWalk[0] = loadImage("goomba0.png");
  gWalk[1] = loadImage("goomba1.png");
  
  //lava
  lavaPop = new PImage[5];
  lavaPop[0] = loadImage("lava0.png");
  lavaPop[1] = loadImage("lava1.png");
  lavaPop[2] = loadImage("lava2.png");
  lavaPop[3] = loadImage("lava3.png");
  lavaPop[4] = loadImage("lava4.png");
  
  //pogo
  pWalk = new PImage[2];
  pWalk[0] = loadImage("hammerbro0.png");
  pWalk[1] = loadImage("hammerbro1.png");
  
  //thwomp
  mad = new PImage[2];
  mad[0] = loadImage("thwomp0.png");
  mad[1] = loadImage("thwomp1.png");
  
}
