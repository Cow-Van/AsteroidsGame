class Spaceship extends Floater {   
  public Spaceship(int[] xCorners, int[] yCorners, int myColor) {
    if (xCorners.length != yCorners.length) {
      throw new IllegalArgumentException();
    }
    
    this.corners = xCorners.length;
    this.xCorners = xCorners;
    this.yCorners = yCorners;
    this.myColor = myColor;
    this.myCenterX = (double) width / 2;
    this.myCenterY = (double) height / 2;
    this.myPointDirection = 0;
  }
  
  public void move() {
    for (int i = 0; i < keysPressed.size(); i++) {
      char pressedKey = keysPressed.get(i);
      
      if (pressedKey == 'w') {
        accelerate(1);
      } else if (pressedKey == 'a') {
        turn(-1);
      } else if (pressedKey == 'd') {
        turn(1);
      }
    }
    
    super.move();
    
    if (!keysPressed.contains('w')) {
      decelerate();
    }
  }
  
  private void decelerate() {
    double angle = Math.atan(myYspeed / myXspeed);
    
    if (myXspeed < 0) {
      if (angle < 0) {
        angle += Math.PI;
      } else if (angle > 0) {
        angle = Math.PI - angle;
      }
    }
    
    if (myXspeed > 0) {
      myXspeed -= Math.cos(angle);
      
     if (myXspeed < 0) {
       myXspeed = 0;
     }
    } else if (myXspeed < 0) {
      myXspeed -= Math.cos(angle);
      
      if (myXspeed > 0) {
        myXspeed = 0;
      }
    }
    
    if (myYspeed > 0) {
      myYspeed -= Math.sin(angle);
      
     if (myYspeed < 0) {
       myYspeed = 0;
     }
    } else if (myYspeed < 0) {
      myYspeed -= Math.sin(angle) * ((myXspeed < 0) ? -1 : 1);
      
      if (myYspeed > 0) {
        myYspeed = 0;
      }
    }
  }
}
