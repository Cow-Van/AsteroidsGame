private Spaceship player;
private ArrayList<Star> stars = new ArrayList();
private int gameState = 0; // 0: Home, 1: Edit, 2: Play, 3: Paused 4: Game Over
private ArrayList<Character> keysPressed = new ArrayList();

public void setup() {
  size(700, 700);
  player = new Spaceship(new int[]{15, -15, -15}, new int[]{0, -15, 15}, 255);
  
  for (int i = 0; i < 50; i++) {
    stars.add(new Star(Math.random() * width, Math.random() * height, 10, 255));
  }
}

public void draw() {
  background(0);
  
  if (gameState == 0) { // Home
    textFont(createFont("asteroidsFont.ttf", 100));
    //text("ABCDEFGHI\nJKLMNOP\n<>%*&\n!#?.,-_+=\nQRSTUVWXYZ\n1234567890", 50, 150);
    (new AsteroidsFont("ABCDEF\nGHIJKL\nMNOPQR\nSTUVWX\nYZ1234\n67890", 10)).draw(50, 50);
  } else if (gameState == 1) { // Edit
  } else if (gameState == 2) { // Play  
    player.move();
    player.show();
    
    for (int i = 0; i < stars.size(); i++) {
      stars.get(i).show();
    }
  } else if (gameState == 3) { // Paused
  } else if (gameState == 4) { // Game Over
  }
}

public void keyPressed() {
  if (key == ' ') {
    player.setXSpeed(0);
    player.setYSpeed(0);
    player.turn(Math.random() * 360);
    player.setX(Math.random() * width);
    player.setY(Math.random() * height);
  } else if (!keysPressed.contains(key)) {
      keysPressed.add(key);
    }
}

public void keyReleased() {
  keysPressed.remove((Object) key);
}
