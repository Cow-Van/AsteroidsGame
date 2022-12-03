class Spaceship extends Floater {   
  private final double accelerationRate = 0.3;
  private final double decelerationRate = 0.3;
  private final double maxSpeed = 20;
  private final double turnRate = 3;
  private final int hyperspaceCooldown = 20;
  
  private int hyperspaceTick = hyperspaceCooldown;
  
  public Spaceship(Coordinate[] shape, int myColor) {
    int[] _xCorners = new int[shape.length];
    int[] _yCorners = new int[shape.length];
    
    for (int i  = 0; i < shape.length; i++) {
      _xCorners[i] = shape[i].getX();
      _yCorners[i] = shape[i].getY();
    }
    
    this.corners = shape.length;
    this.xCorners = _xCorners;
    this.yCorners = _yCorners;
    this.myColor = myColor;
    this.myCenterX = (double) width / 2;
    this.myCenterY = (double) height / 2;
    this.myPointDirection = 0;
  }
  
  public void move() {
    if (keysPressed.contains('w')) {
      double oldXspeed = myXspeed;
      double oldYspeed = myYspeed;
      
      accelerate(accelerationRate);
      
      if (Math.sqrt(myXspeed * myXspeed + myYspeed * myYspeed) > maxSpeed) {
        myXspeed = oldXspeed;
        myYspeed = oldYspeed;
      }
    }
    
    if (keysPressed.contains('a')) {
      turn(-turnRate);
    } 
    
    if (keysPressed.contains('d')) {
      turn(turnRate);
    } 
    
    if (keysPressed.contains(' ') && hyperspaceTick >= hyperspaceCooldown) {
      myXspeed = 0;
      myYspeed = 0;
      turn(Math.random() * 360);
      myCenterX = Math.random() * width;
      myCenterY = Math.random() * height;
      hyperspaceTick = 0;
    }
    
    super.move();
    
    if (!keysPressed.contains('w')) {
      decelerate();
    }
    
    hyperspaceTick++;
  }
  
  public double getX() {
    return myCenterX;
  }
  
  public double getY() {
    return myCenterY;
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
      myXspeed -= Math.cos(angle) * decelerationRate;
      
     if (myXspeed < 0) {
       myXspeed = 0;
     }
    } else if (myXspeed < 0) {
      myXspeed -= Math.cos(angle) * decelerationRate;
      
      if (myXspeed > 0) {
        myXspeed = 0;
      }
    }
    
    if (myYspeed > 0) {
      myYspeed -= Math.sin(angle) * decelerationRate;
      
     if (myYspeed < 0) {
       myYspeed = 0;
     }
    } else if (myYspeed < 0) {
      myYspeed -= Math.sin(angle) * ((myXspeed < 0) ? -1 : 1)  * decelerationRate;
      
      if (myYspeed > 0) {
        myYspeed = 0;
      }
    }
  }
}
