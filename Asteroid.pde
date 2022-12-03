class Asteroid extends Floater{
  private final double rotationRate = 1;
  private final double spawnBuffer = 20;
  
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
    this.myCenterX = 100;
    this.myCenterY = 100;
    this.myPointDirection = 0;
    //dist((float) myCenterX, (float) myCenterY, (float) width / 2, (float) height / 2);
    
    double deltaX = myCenterX - width / 2;
    double deltaY = myCenterY - height / 2;
    
    if (deltaX >= 0) {
      if (deltaY >= 0) {
        Math.tan(Math.abs(deltaY) / Math.abs(deltaX));
      } else {
        
      }
    } else {
      if (deltaY >= 0) {
        
      } else {
        
      }
    }
      
  }
}
