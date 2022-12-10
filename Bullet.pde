class Bullet extends Floater {
  private final double buffer = 15;
  private final double size = 10;
  
  private boolean deleted = false;
  
  public Bullet() {
    this.myCenterX = player.getX();
    this.myCenterY = player.getY();
    this.myPointDirection = player.getDirection();
    this.myColor = #FF00FF;
    accelerate(10);
  }
  
  public void show() {
    fill(myColor);   
    stroke(myColor);    
    
    ellipse((float) myCenterX, (float) myCenterY, (float) size, (float) size);
  }
  
  public void move() {
    if (myCenterX < -buffer || myCenterX > width + buffer || myCenterY < -buffer || myCenterY > height + buffer) {
      deleted = true;
    } else {
      myCenterX += myXspeed;
      myCenterY += myYspeed;
      
      for (int i = 0; i < asteroids.size(); i++) {
        if (Math.sqrt(Math.pow(asteroids.get(i).getX() - myCenterX, 2) + Math.pow(asteroids.get(i).getY() - myCenterY, 2)) < 60) {
          asteroids.get(i).setDeleted(true);
          deleted = true;
        }
      }
    }
  }
  
  public boolean isDeleted() {
    return deleted;
  }
}
