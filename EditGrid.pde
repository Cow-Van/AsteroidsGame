class EditGrid {
  private final int _height = 21;
  private final int _width = 21;
  private final double boxWidth = 25;
  private final double boxHeight = 25;
  private final int gridColor = #FFFFFF;
  private final double gridAlpha = 100;
  private final int cursorColor = #FF0000;
  private final double cursorAlpha = 255;
  private final double cursorSize = 10;
  
  private final double x;
  private final double y;
  private final double xOffset;
  private final double yOffset;
  
  private int cursorX = 21;
  private int cursorY = 21;
  
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
    stroke(gridColor, (float) gridAlpha);
    
    for (int i = 0; i <= _width;  i++) {
      line((float) (x - xOffset + i * boxWidth), (float) (y - yOffset), (float) (x - xOffset + i * boxWidth), (float) (y - yOffset + _height * boxHeight));
    }
    
    for (int i = 0; i <= _height; i++) {
      line((float) (x - xOffset), (float) (y - yOffset + i * boxHeight), (float) (x - xOffset + _width * boxWidth), (float) (y - yOffset + i * boxHeight));
    }
    
    noStroke();
    fill(cursorColor, (float) cursorAlpha);
    
    ellipse((float) (x - xOffset + cursorX * boxWidth), (float) (y - yOffset + cursorY * boxHeight), (float) cursorSize, (float) cursorSize);
  }
}
