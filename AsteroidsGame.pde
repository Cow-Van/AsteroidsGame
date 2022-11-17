private Spaceship player;
private int gameState = 2; // 0: Home, 1: Edit, 2: Play, 3: Paused 4: Game Over

public void setup() {
  size(700, 700);
  player = new Spaceship(4, new int[]{0, 50, 50, 0}, new int[]{0, 0, 50, 50}, 255);
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
  if (key == 'w') {
    player.accelerate(5);
  }
  
  if (key == 'a') {
    player.turn(-10);
  }
  
  if (key == 'd') {
    player.turn(10);
  }
}
