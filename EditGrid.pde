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
  private final double cursorSize = 6;
  private final int cursorCooldown = 9;
  private final int cursorTogglePointCooldown = 20;
  private final int centerDotColor = #00FF00;
  private final double centerDotAlpha = 100;
  private final double centerDotSize = 15;
  private final int shapeVertexColor = #FFFFFF;
  private final double shapeVertexAlpha = 255;
  private final double shapeVertexSize = 8;
  private final int shapeLineColor = #FFFFFF;
  private final double shapeLineAlpha = 255;
  private final double shapeLineThickness = 1;
  private final int closeShapeCooldown = 13;
  
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
  private boolean closeShape = false;
  private int closeShapeCooldownTick = closeShapeCooldown;
  
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
    if (keysPressed.contains('m') && (closeShape || shape.size() < 3)) {
      gameState = 0;
      return;
    }
    
    if (keysPressed.contains('w') && cursorCooldownTickUp >= cursorCooldown && cursorY > 0) {
      cursorCooldownTickUp = 0;
      cursorY--;
    }
    
    if (keysPressed.contains('s') && cursorCooldownTickDown >= cursorCooldown && cursorY < _height) {
      cursorCooldownTickDown = 0;
      cursorY++;
    }
    
    if (keysPressed.contains('a') && cursorCooldownTickLeft >= cursorCooldown && cursorX > 0) {
      cursorCooldownTickLeft = 0;
      cursorX--;
    }
    
    if (keysPressed.contains('d') && cursorCooldownTickRight >= cursorCooldown && cursorX < _width) {
      cursorCooldownTickRight = 0;
      cursorX++;
    }
    
    if (keysPressed.contains(' ') && cursorTogglePointCooldownTick >= cursorTogglePointCooldown) {
      cursorTogglePointCooldownTick = 0;
      
      if (remove(shape, new Coordinate(cursorX, cursorY)) == null) {
        shape.add(new Coordinate(cursorX, cursorY));
      }
    }
    
    if (keysPressed.contains('\n') && closeShapeCooldownTick >= closeShapeCooldown) {
      closeShapeCooldownTick = 0;
      
      closeShape = !closeShape;
    }
    
    cursorCooldownTickUp++;
    cursorCooldownTickDown++;
    cursorCooldownTickLeft++;
    cursorCooldownTickRight++;
    cursorTogglePointCooldownTick++;
    closeShapeCooldownTick++;
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
    
    stroke(shapeLineColor, (float) shapeLineAlpha);
    strokeWeight((float) shapeLineThickness);
    fill(0, 0);
    
    beginShape();
    
    for (int i = 0; i < shape.size(); i++) {
      vertex((float) (x - xOffset + shape.get(i).getX() * boxWidth), (float) (y - yOffset + shape.get(i).getY() * boxHeight));      
    }
    
    if (closeShape && shape.size() > 0) {
      fill(255, 200);
      vertex((float) (x - xOffset + shape.get(0).getX() * boxWidth), (float) (y - yOffset + shape.get(0).getY() * boxHeight));
    }
    
    endShape((closeShape) ? CLOSE : OPEN);
    strokeWeight(1);
    
    noStroke();
    fill(shapeVertexColor, (float) shapeVertexAlpha);
    
    for (int i = 0; i < shape.size(); i++) {
      ellipse((float) (x - xOffset + shape.get(i).getX() * boxWidth), (float) (y - yOffset + shape.get(i).getY() * boxHeight), (float) shapeVertexSize, (float) shapeVertexSize);
    }
    
    fill(cursorColor, (float) cursorAlpha);
    
    ellipse((float) (x - xOffset + cursorX * boxWidth), (float) (y - yOffset + cursorY * boxHeight), (float) cursorSize, (float) cursorSize);
  }
  
  public Coordinate[] getShape() {
    Coordinate[] coords = new Coordinate[shape.size()];
    
    for (int i = 0; i < coords.length; i++) {
      coords[i] = new Coordinate(shape.get(i).getX() * 5, shape.get(i).getY() * 5);
    }
    
    return coords;
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
