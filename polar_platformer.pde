
World world;

boolean grid = false;

void setup() {
  size(800,800);
  //fullScreen();
  world = new World();
  world.addPlatform(new Platform(0,5,false), 4);
  world.addPlatform(new Platform(6,9,false), 6);
  world.addPlatform(new Platform(32,34,true), 7);
  //world.addPlatform(new Platform(0,36,false), 8);
  world.addPlatform(new Platform(0,20,false), 8);
  world.addPlatform(new Platform(22,36,false), 8);
  
  world.addPlatform(new Platform(20,22,true), 12);
  world.addPlatform(new Platform(17,20,false), 12);
  world.addPlatform(new Platform(22,36,false), 12);
  
  for(int i = 0; i < 40; i = i+2) {
    world.addPlatform(new Platform(0+i,3+i,false), 14+i/2);
  }
  
  world.addPlatform(new Platform(0,35,false), 40);
 
}


void draw() {
  translate(width/2, height/2);
  background(#6D83FA);
  world.render();
  world.step();
  //world.render();
}


void keyPressed() {
  switch(key) {
    case 'a':
      world.p.movingLeft = true;
      break;
    case 'd':
      world.p.movingRight = true;
      break;
    case ' ':
      world.p.jump = true;
      break;
    case 'g':
      grid = !grid;
      break;
  }
}

void keyReleased() {
  switch(key) {
    case 'a':
      world.p.movingLeft = false;
      break;
    case 'd':
      world.p.movingRight = false;
      break;
    case ' ':
      world.p.jump = false;
      break;
    
  }
}
