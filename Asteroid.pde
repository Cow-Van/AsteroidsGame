class Asteroid extends Floater{
  private final double rotationRate = 60;
  private final double spawnBuffer = 50;
  private final double directionRandom = 60;
  private final double originalDirection;
  
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
    this.myXspeed = Math.cos(this.originalDirection * Math.PI / 180);
    this.myYspeed = Math.sin(this.originalDirection * Math.PI / 180);
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
    
    if(myCenterX >width) {     
      myCenterX = 0;    
    } else if (myCenterX<0) {
      myCenterX = width;    
    }   
    
    if(myCenterY > height) {    
      myCenterY = 0;    
    } else if (myCenterY < 0) {     
      myCenterY = height;    
    } 
  }
}
