class Spaceship extends Floater {   
    public Spaceship(int corners, int[] xCorners, int[] yCorners, int myColor) {
      this.corners = corners;
      this.xCorners = xCorners;
      this.yCorners = yCorners;
      this.myColor = myColor;
      this.myCenterX = (double) width / 2;
      this.myCenterY = (double) height / 2;
      this.myPointDirection = 0;
    }
}
