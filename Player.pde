
class Player {
  
  float angle;
  float depth;
  int size = 40;
  int fixedLocation;
  
  float vel = 0;
  float acc = .003;
  
  boolean movingLeft = false;
  boolean movingRight = false;
  boolean jump = false;
  boolean jumped = true;
  
  
  Player(float angle, float depth, int fixedLocation) {
    this.angle = angle;
    this.depth = angle;
    this.fixedLocation = fixedLocation;
    
  }
  
  void render() {
    fill(0,0,0);
    circle(0,-fixedLocation-size/2, size);
  }
  
  void step() {
    
    if(depth > 50) {depth = -10;}
    
    if(jump && !jumped) {
      jumped = true;
      vel = -.12;
    }
    
    vel = min(.07,vel+acc);
    depth += vel;
    
    if(movingLeft) angle -= 0.5;
    if(movingRight) angle += 0.5;
    if(angle > 360) angle -= 360;
    else if(angle < 360) angle += 360;
  }
  
  void checkCollision(Platform plat, int ring) {
    if(angle/10 > plat.startSeg && angle/10 < plat.endSeg) {
      float bottom = depth;
      float top = depth-(float(size)/50);
      println("depth:");
      println(depth);
      println("bottom:");
      println(bottom);
      println("top:");
      print(top);
      
      if(bottom > ring && top < ring) {
        depth -= bottom-ring;
        vel = 0;
        jumped = false;
        if(plat.dangerous) {
          vel = -0.21;
        }
      }
      if(top < ring+1 && bottom > ring+1) {
        println("bump");
        depth += ring+1 - top;
        vel = 0;
      }
    }
  }
  
}
