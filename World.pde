
class World {
  
  ArrayList<ArrayList<Platform>> rings;
  Player p;
  
  int PLAYER_LOCATION = 200;
  
  
  
  World() {
    rings = new ArrayList<ArrayList<Platform>>();
     p = new Player(1, 0, PLAYER_LOCATION);
  }
  
  
  void addPlatform(Platform plat, int ring) {
    for(int i = rings.size(); i < ring+1; i++) {
      rings.add(null);
    }
    println(rings.size());
    if(rings.get(ring) == null) rings.set(ring, new ArrayList<Platform>());
    rings.get(ring).add(plat);
  }
  
  void render() {
    renderPlatforms();
    p.render();
    if(grid) {
      drawGrid();
    }
    //drawGrid();
    return;
  }
  
  void step() {
    p.step();
    playerCollision();
  }
  
  void playerCollision() {
    for(int i = max(0,floor(p.depth)-1); i <= floor(p.depth)+1; i++) {
      if(i >= rings.size()) {break;}
      if(rings.get(i) == null) {continue;}
      for(Platform plat : rings.get(i)) {
        p.checkCollision(plat, i);
      }
    }
  }
  
  
  void renderPlatforms() {
    int min = max(0,floor(p.depth)-10);
    int max = floor(p.depth)+10;
    for(int i = min; i < max; i++) {
      if(i >= rings.size()) {break;}
      if(rings.get(i) == null) {continue;}
      for(Platform plat : rings.get(i)) {
        plat.render(depthToRadius(i-p.depth), depthToRadius(i-p.depth+1), p.angle);
      }
    }
  }
  
  
  void drawGrid() {
    stroke(2);
    for(int i = 0; i < 360; i = i + 10) {
      float rad = radians(i-p.angle);
      line(0,0,cos(rad)*width,sin(rad)*height);
    }
    noFill();
    for(int i = floor(p.depth)-5; i < floor(p.depth)+10; i++) {
      circle(0,0,depthToRadius(i-p.depth)*2);
    }
  } 
  
  
  float depthToRadius(float depth) {
    println(depth);
    return sq(depth-10)*2;
    
    
  }
  
}
