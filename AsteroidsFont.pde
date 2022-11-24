class AsteroidsFont {
  private final double CHAR_WIDTH = 49;
  private final double CHAR_HEIGHT = 74;
  private final double buffer = 10;
  private final FontCharMap charMap = new FontCharMap();
  
  private final String s;
  private final double size;

  
  public AsteroidsFont(String s, int size) {
    this.s = s.toLowerCase();
    this.size = size * 0.1;
  }
  
  public void draw(double x, double y) {
    String[] lines = s.split("\n");
    for (int k = 0; k < lines.length; k++) {
      for (int i = 0; i < lines[k].length(); i++) {
        Coordinate[] coords = charMap.get(lines[k].charAt(i) + "");
        for (int j = 0; j < coords.length; j++) {
          noStroke();
          fill(255);
          rect((float) (x + i * (CHAR_WIDTH + (i > 0 ? buffer : 0)) * size + coords[j].getX() * size), (float) (y + k * (CHAR_HEIGHT + (k > 0 ? buffer : 0)) * size + coords[j].getY() * size), (float) size, (float) size);
        }
      }
    }
  }
}
