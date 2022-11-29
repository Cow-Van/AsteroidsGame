class EditGrid {
  private final int _height = 21;
  private final int _width = 21;
  private final double boxWidth = 10;
  private final double boxHeight = 10;
  private final int gridColor = #FFFFFF;
  private final float gridAlpha = 200;
  
  private final double x;
  private final double y;
  private final double xOffset;
  private final double yOffset;
  
  private int cursorX = 0;
  private int cursorY = 0;
  
  public EditGrid(double x, double y, boolean centered) {
    this.x = x;
    this.y = y;
    
    if (centered) {
      xOffset = boxWidth * _width / 2;
      yOffset = boxHeight * _height / 2;
    } else {
      xOffset = 0;
      yOffset = 0;
    }
  }
  
  public void update() {
    
  }
  
  public void show() {
    stroke(gridColor, gridAlpha);
    
    for (int i = 0; i < _width;  i++) {
      line(x - xOffset + i * boxWidth, y - yOffset, 10, 10);
    }
    
    for (int i = 0; i < _height; i++) {
      
    }
  }
}
