void c(color s, color f, float sw) {
  stroke(s);
  if(s == noStroke) noStroke();
  fill(f);
  if(f == noFill) noFill();
  strokeWeight(sw);
}

void c(color s, color f, float sw, float opp) {
  stroke(s, opp);
  if(s == noStroke) noStroke();
  fill(f, opp);
  if(f == noFill) noFill();
  strokeWeight(sw);
}

PImage reverseImage( PImage image ) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB );

  for ( int i=0; i < image.width; i++ ) {
    for (int j=0; j < image.height; j++) {
      int xPixel, yPixel;
      xPixel = image.width - 1 - i;
      yPixel = j;
      reverse.pixels[yPixel*image.width+xPixel]=image.pixels[j*image.width+i] ;
    }
  }
  return reverse;
}

void click() {
  mouseReleased = false;
  if(mousePressed) wasPressed = true;
  if(wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}
