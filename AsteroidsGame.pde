private Spaceship player;
private int gameState = 2; // 0: Home, 1: Edit, 2: Play, 3: Paused 4: Game Over
private ArrayList<Character> keysPressed = new ArrayList();

public void setup() {
  size(700, 700);
  player = new Spaceship(new int[]{25, -25, -25}, new int[]{0, -25, 25}, 255);
}
public void draw() {
  background(0);
  
  if (gameState == 0) { // Home
  } else if (gameState == 1) { // Edit
  } else if (gameState == 2) { // Play  
    player.move();
    player.show();
  } else if (gameState == 3) { // Paused
  } else if (gameState == 4) { // Game Over
  }
}

public void keyPressed() {
  if (!keysPressed.contains(key)) {
    keysPressed.add(key);
  }
}

public void keyReleased() {
  keysPressed.remove((Object) key);
}
