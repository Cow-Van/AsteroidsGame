class AsteroidsFontText {
  private final double CHAR_WIDTH = 49;
  private final double CHAR_HEIGHT = 74;
  private final double xBuffer;
  private final double yBuffer;
  
  private String s;
  private double size;
  private boolean centered;
  private double _width;
  private double _height;
  
  public AsteroidsFontText(String s, double size, boolean centered, double xBuffer, double yBuffer) {
    this.s = s.toLowerCase();
    this.size = size * 0.1;
    this.centered = centered;
    this.xBuffer = xBuffer;
    this.yBuffer = yBuffer;
    
    updateWidth();
    updateHeight();
  }
  
  public void show(double x, double y) {
    if (centered) {
      x -= getWidth() / 2;
      y -= getHeight() / 2;
    }
    
    String[] lines = s.split("\n");    
    for (int k = 0; k < lines.length; k++) {
      double lineWidth = CHAR_WIDTH * size * lines[k].length() + xBuffer * size * (lines[k].length() - 1);
      double xShift = 0;
      
      if (centered && lineWidth < getWidth()) {
        xShift = (getWidth() - lineWidth) / 2;
      }
      
      for (int i = 0; i < lines[k].length(); i++) {
        Coordinate[] coords = charMap.get(lines[k].charAt(i) + "");
        
        for (int j = 0; j < coords.length; j++) {
          noStroke();
          fill(255);
          rect((float) (x + xShift + i * (CHAR_WIDTH + (i > 0 ? xBuffer : 0)) * size + coords[j].getX() * size), (float) (y + k * (CHAR_HEIGHT + (k > 0 ? yBuffer : 0)) * size + coords[j].getY() * size), (float) size + 1, (float) size + 1);
        }
      }
    }
  }
  
  public double getWidth() {
    return _width;
  }
  
  public double getHeight() {
    return _height;
  }
  
  private void updateWidth() {
    String[] lines = s.split("\n");
    String longestString = lines[0];
    
    for (int i = 1; i < lines.length; i++) {
      if (longestString.length() < lines[i].length()) {
        longestString = lines[i];
      }
    }
    
    _width = CHAR_WIDTH * size * longestString.length() + xBuffer * size * (longestString.length() - 1);
  }
  
  private void updateHeight() {
    String[] lines = s.split("\n");
    
    _height = CHAR_HEIGHT * size * lines.length + yBuffer * size * (lines.length - 1);
  }
}
