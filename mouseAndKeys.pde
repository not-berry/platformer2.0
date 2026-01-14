void keyPressed() {
  if(keyCode == 'w' || keyCode == 'W' || keyCode == UP) upKey = true;
  if(keyCode == 'a' || keyCode == 'A' || keyCode == LEFT) leftKey = true;
  if(keyCode == 'd' || keyCode == 'D' || keyCode == RIGHT) rightKey = true;
  if(keyCode == 's' || keyCode == 'S' || keyCode == DOWN) downKey = true;
  if(keyCode == ' ') spacebar = true;
}

void keyReleased() {
  if(keyCode == 'w' || keyCode == 'W' || keyCode == UP) upKey = false;
  if(keyCode == 'a' || keyCode == 'A' || keyCode == LEFT) leftKey = false;
  if(keyCode == 'd' || keyCode == 'D' || keyCode == RIGHT) rightKey = false;
  if(keyCode == 's' || keyCode == 'S' || keyCode == DOWN) downKey = false;
  if(keyCode == ' ') spacebar = false;
}
