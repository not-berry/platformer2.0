void intro() {
  background(iBackground);
  
  //name
  textAlign(CENTER);
  textSize(200);
  fill(white);
  text("NOT MARIO", width/2,height/2-100);
  
  //start buttton
  myButtons[0].show();
  myButtons[0].act();
  if(myButtons[0].clicked && mouseButton == LEFT) mode = "game";
}
