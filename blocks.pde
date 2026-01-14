void normBlock(float x, float y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  b.setStrokeWeight(5);
  
  //properties
  b.setStatic(true);
  
  world.add(b);
}
