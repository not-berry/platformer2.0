void block(float x, float y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  b.attachImage(brick);
  
  //properties
  b.setStatic(true);
  
  world.add(b);
}

void dirt(int x, int y) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  
  //looks
  if (map.get(x-1, y) == black && map.get(x+1, y) == black && map.get(x, y-1) != black) b.attachImage(dirt_n);
  else if(map.get(x, y+1) == black && map.get(x, y-1) == black && map.get(x+1, y) != black) b.attachImage(dirt_e);
  else if(map.get(x, y-1) == black && map.get(x, y+1) == black && map.get(x-1, y) != black) b.attachImage(dirt_w);
  else if(map.get(x-1, y) == black && map.get(x+1, y) == black && map.get(x, y+1) != black) b.attachImage(dirt_s);
  else if(map.get(x-1, y) != black && map.get(x, y-1) != black) b.attachImage(dirt_nw);
  else if(map.get(x+1, y) != black && map.get(x, y-1) != black) b.attachImage(dirt_ne);
  else if(map.get(x, y+1) != black && map.get(x-1, y) != black) b.attachImage(dirt_sw);
  else if(map.get(x, y+1) != black && map.get(x+1, y) != black) b.attachImage(dirt_se);
  else b.attachImage(dirt_center);
  
  
  //properties
  b.setStatic(true);
  
  world.add(b);
}
