class EditGrid {
  private final ArrayList<Coordinate> shape = new ArrayList();
  private final int _width = 20;
  private final int _height = 20;
  private final double boxWidth = 25;
  private final double boxHeight = 25;
  private final int gridColor = #FFFFFF;
  private final double gridAlpha = 100;
  private final int cursorColor = #FF0000;
  private final double cursorAlpha = 255;
  private final double cursorSize = 10;
  private final int cursorCooldown = 9;
  private final int cursorTogglePointCooldown = 10;
  private final int centerDotColor = #00FF00;
  private final double centerDotAlpha = 100;
  private final double centerDotSize = 15;
  private final int shapeVertexColor = #FFFFFF;
  private final double shapeVertexAlpha = 255;
  private final double shapeVertexSize = 10;
  private final int shapeLineColor = #FFFFFF;
  private final double shapeLineAlpha = 255;
  private final double shapeLineThickness = 5;
  
  private final double x;
  private final double y;
  private final double xOffset;
  private final double yOffset;
  
  private int cursorX = _width / 2;
  private int cursorY = _height / 2;
  private int cursorCooldownTickUp = cursorCooldown;
  private int cursorCooldownTickDown = cursorCooldown;
  private int cursorCooldownTickLeft = cursorCooldown;
  private int cursorCooldownTickRight= cursorCooldown;
  private int cursorTogglePointCooldownTick = cursorTogglePointCooldown;
  
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
    if (codedKeysPressed.contains(UP) && cursorCooldownTickUp >= cursorCooldown && cursorY > 0) {
      cursorCooldownTickUp = 0;
      cursorY--;
    }
    
    if (codedKeysPressed.contains(DOWN) && cursorCooldownTickDown >= cursorCooldown && cursorY < _height) {
      cursorCooldownTickDown = 0;
      cursorY++;
    }
    
    if (codedKeysPressed.contains(LEFT) && cursorCooldownTickLeft >= cursorCooldown && cursorX > 0) {
      cursorCooldownTickLeft = 0;
      cursorX--;
    }
    
    if (codedKeysPressed.contains(RIGHT) && cursorCooldownTickRight >= cursorCooldown && cursorX < _width) {
      cursorCooldownTickRight = 0;
      cursorX++;
    }
    
    if (keysPressed.contains(' ') && cursorTogglePointCooldownTick >= cursorTogglePointCooldown) {
      cursorTogglePointCooldownTick = 0;
      
      if (remove(shape, new Coordinate(cursorX, cursorY)) == null) {
        shape.add(new Coordinate(cursorX, cursorY));
      }
    }
    
    cursorCooldownTickUp++;
    cursorCooldownTickDown++;
    cursorCooldownTickLeft++;
    cursorCooldownTickRight++;
    cursorTogglePointCooldownTick++;
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
    fill(centerDotColor, (float) centerDotAlpha);
    ellipse((float) (x - xOffset + (int) (_width / 2) * boxWidth), (float) (y - yOffset + (int) (_height / 2) * boxHeight), (float) centerDotSize, (float) centerDotSize);
    
    stroke(shapeLineColor);
    beginShape();
    
    for (int i = 0; i < shape.size(); i++) {
      vertex((float) (x - xOffset + shape.get(i).getX() * boxWidth), (float) (y - yOffset + shape.get(i).getY() * boxHeight));
    }
    
    endShape();
    
    noStroke();
    fill(cursorColor, (float) cursorAlpha);
    
    ellipse((float) (x - xOffset + cursorX * boxWidth), (float) (y - yOffset + cursorY * boxHeight), (float) cursorSize, (float) cursorSize);
  }
  
  private Coordinate remove(ArrayList<Coordinate> list, Coordinate coord) {
    for (int i = 0; i < list.size(); i++) {
      if (list.get(i).getX() == coord.getX() && list.get(i).getY() == coord.getY()) {
        return list.remove(i);
      }
    }
    
    return null;
  }
}
