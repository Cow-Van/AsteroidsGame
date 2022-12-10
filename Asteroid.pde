class Asteroid extends Floater {
  private final double originalRotationRate = 60;
  private final double spawnBuffer = 100;
  private final double directionRandom = 60;
  private final double originalDirection;
  private final double rotationRate;
  
  private boolean deleted = false;
  
  public Asteroid(Coordinate[] shape, int myColor) {
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
    
    if (Math.random() < 0.5) {
      this.myCenterX = Math.random() * width;
      this.myCenterY = (Math.random() < 0.5) ? -spawnBuffer : height + spawnBuffer;
    } else {
      this.myCenterX = (Math.random() < 0.5) ? -spawnBuffer : width + spawnBuffer;
      this.myCenterY = Math.random() * height;
    }
    
    this.rotationRate = originalRotationRate + (Math.random() * 20 / 10);
    double deltaX = myCenterX - (double) width / 2;
    double deltaY = myCenterY - (double) height / 2;
    double directionVariance = Math.random() * directionRandom - (double) directionRandom / 2;
    
    if (deltaX > 0) {
      if (deltaY >= 0) {
        this.originalDirection = directionVariance + 180 + Math.atan(Math.abs(deltaY) / Math.abs(deltaX)) * 180 / Math.PI;
      } else {
        this.originalDirection = directionVariance + 180 - Math.atan(Math.abs(deltaY) / Math.abs(deltaX)) * 180 / Math.PI;
      }
    } else if (deltaX < 0) {
      if (deltaY >= 0) {
        this.originalDirection = directionVariance - Math.atan(Math.abs(deltaY) / Math.abs(deltaX)) * 180 / Math.PI;
      } else {
        this.originalDirection = directionVariance + Math.atan(Math.abs(deltaY) / Math.abs(deltaX)) * 180 / Math.PI;
      }
    } else {
      if (deltaY >= 0) {
        this.originalDirection = directionVariance - 90;
      } else {
        this.originalDirection = directionVariance + 90;
      }
    }
    
    this.myPointDirection = this.originalDirection;
    
    double speedMultiplier = Math.random() * 2 - 0.5;
    
    this.myXspeed = Math.cos(this.originalDirection * Math.PI / 180) * speedMultiplier;
    this.myYspeed = Math.sin(this.originalDirection * Math.PI / 180) * speedMultiplier;
  }
  
  public void show() {             
    fill(0, 0);   
    stroke(myColor);    
    
    translate((float) myCenterX, (float) myCenterY);

    float dRadians = (float) (myPointDirection * (Math.PI/180));
    
    rotate(dRadians);
    
    beginShape();
    
    for (int nI = 0; nI < corners; nI++) {
      vertex(xCorners[nI], yCorners[nI]);
    }
    
    endShape(CLOSE);

    rotate(-1 * dRadians);
    translate(-1 * (float) myCenterX, -1 * (float) myCenterY);
  }
  
  public void move() {    
    myPointDirection += rotationRate * PI / 180;
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    
    if (dist((float) myCenterX, (float) myCenterY, (float) player.getX(), (float) player.getY()) < 70) {
      deleted = true;
      gameState = 4;
      return;
    }
    
    if (myCenterX < -spawnBuffer - 100 || myCenterX > width + spawnBuffer + 100 || myCenterY < -spawnBuffer - 100 || myCenterY > height + spawnBuffer + 100) {
      deleted = true;
    }
  }
  
  public void setDeleted(boolean deleted) {
    this.deleted = deleted;
  }
  
  public boolean isDeleted() {
    return deleted;
  }
  
  public double getX() {
    return myCenterX;
  }
  
  public double getY() {
    return myCenterY;
  }
}
