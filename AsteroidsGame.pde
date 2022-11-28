private final FontCharMap charMap = new FontCharMap();
private final ArrayList<Character> keysPressed = new ArrayList();
private final ArrayList<Integer> codedKeysPressed = new ArrayList();
private final ArrayList<Star> stars = new ArrayList();
private final AsteroidsFontText title = new AsteroidsFontText("asteroids", 10, true, 10, 10);
private final AsteroidsFontText subtitle = new AsteroidsFontText("press space to play\npress e to edit", 4, true, 15, 30);
private final EditGrid editGrid = new EditGrid(350, 350, true);

private Spaceship player;
private int gameState = 0; // 0: Home, 1: Edit, 2: Play, 3: Paused 4: Game Over

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
    title.show(350, 275);
    subtitle.show(350, 375);
    
    if (keysPressed.contains(' ')) {
      gameState = 2;
    } else if (keysPressed.contains('e')) {
      gameState = 1;
    }
  } else if (gameState == 1) { // Edit
    editGrid.show();
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
  if (key == CODED) {
    if (!codedKeysPressed.contains(keyCode)) {
      codedKeysPressed.add(keyCode);
    }
  } else {
    if (!keysPressed.contains(key)) {
        keysPressed.add(key);
    }
  }
}

public void keyReleased() {
  if (key == CODED) {
    codedKeysPressed.remove((Object) keyCode);
  } else {
    keysPressed.remove((Object) key);
  }
}
