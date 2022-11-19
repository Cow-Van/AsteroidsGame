class Star {
  private double x;
  private double y;
  private double radius;
  private int _color;
  
  public Star(double x, double y, double radius, int _color) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this._color = _color;
  }
  
  public void show() {
    fill(_color);
    ellipse((float) x, (float) y, (float) radius, (float) radius);
  }
}
