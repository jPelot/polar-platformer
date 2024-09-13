class Platform {
  
  int startSeg;
  int endSeg;
  boolean dangerous;
  
  Platform(int startSeg, int endSeg, boolean dangerous) {
    this.startSeg = startSeg;
    this.endSeg = endSeg;
    this.dangerous = dangerous;
  }
  
  
  void render(float radius, float r2, float angle) {
    noStroke();
    
    fill(#000000);
    if(dangerous) {
      fill(#E30505);
    }
    arc(0,0,radius*2,radius*2,radians(startSeg*10-angle)-(PI/2),radians(endSeg*10-angle)-(PI/2));
    fill(#6D83FA);
    arc(0,0,r2*2,r2*2,radians((startSeg-1)*10-angle)-(PI/2),radians((endSeg+1)*10-angle)-(PI/2));
    //circle(0,0,r2*2);
    return;
  }
  
}
