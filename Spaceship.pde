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
    
    public void move() {
      super.move();
      
      double angle = Math.atan(myYspeed / myXspeed);
      
      if (myXspeed < 0) {
        if (angle < 0) {
          angle += Math.PI;
        } else if (angle > 0) {
          angle = Math.PI - angle;
        }
      }
      
      if (myXspeed > 0) {
        System.out.println("xp");
        myXspeed -= Math.cos(angle);
        
       if (myXspeed < 0) {
         myXspeed = 0;
       }
      } else if (myXspeed < 0) {
        System.out.println("xn");
        myXspeed -= Math.cos(angle);
        
        if (myXspeed > 0) {
          myXspeed = 0;
        }
      }
      
      // TODO FIX
      if (myYspeed > 0) {
        System.out.println("yp");
        myYspeed -= Math.sin(angle);
        
       if (myYspeed < 0) {
         myYspeed = 0;
       }
      } else if (myYspeed < 0) {
        System.out.println("yn");
        myYspeed -= Math.sin(angle);
        
        if (myYspeed > 0) {
          myYspeed = 0;
        }
      }
    }
}
