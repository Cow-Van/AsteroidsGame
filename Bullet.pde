class Bullet extends Floater {
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

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    ellipse((float) myCenterX, (float) myCenterY, 10, 10);
  }
}
