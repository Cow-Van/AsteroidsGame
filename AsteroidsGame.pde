import java.util.Iterator;

private final FontCharMap charMap = new FontCharMap();
private final ArrayList<Character> keysPressed = new ArrayList();
private final ArrayList<Integer> codedKeysPressed = new ArrayList();
private final ArrayList<Star> stars = new ArrayList();
private final ArrayList<Asteroid> asteroids = new ArrayList();
private final ArrayList<Bullet> bullets = new ArrayList();
private final AsteroidsFontText title = new AsteroidsFontText("asteroids", 10, true, 10, 10);
private final AsteroidsFontText subtitle = new AsteroidsFontText("press space to play\npress e to edit", 4, true, 15, 30);
private final EditGrid editGrid = new EditGrid(350, 350, true);
private final double originalAsteroidsSpawnDelay = 10;

private Spaceship player;
private int gameState = 0; // 0: Home, 1: Edit, 2: Play, 3: Paused 4: Game Over
private double asteroidsSpawnDelay = originalAsteroidsSpawnDelay * (Math.random() * 5 - 2.5);
private double asteroidsSpawnDelayTick = asteroidsSpawnDelay;

public void setup() {
  size(700, 700);
  
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
      
      if (editGrid.getShape().length >= 3) {
        player = new Spaceship(editGrid.getShape(), 255);
      } else {
        player = new Spaceship(new Coordinate[]{new Coordinate(30, 0), new Coordinate(-15, -15), new Coordinate(-15, 15)}, 255);
      }
    } else if (keysPressed.contains('e')) {
      gameState = 1;
    }
  } else if (gameState == 1) { // Edit 
    editGrid.update();
    editGrid.show();
  } else if (gameState == 2) { // Play
    if (keysPressed.contains('m')) {
      gameState = 0;
      
      resetGame();
    }
  
    for (int i = 0; i < stars.size(); i++) {
      stars.get(i).show();
    }
    
    if (asteroids.size() < 20 && asteroidsSpawnDelay <= asteroidsSpawnDelayTick) {
      asteroidsSpawnDelay = originalAsteroidsSpawnDelay * (Math.random() * 5 - 5 / 2.5);
      asteroidsSpawnDelayTick = 0;
      
      asteroids.add(new Asteroid(new Coordinate[]{new Coordinate(1 * 15, 4 * 15), new Coordinate(3 * 15, 2 * 15), new Coordinate(4 * 15, 0 * 15), new Coordinate(1 * 15, -2 * 15), new Coordinate(0 * 15, -4 * 15), new Coordinate(-2 * 15, -3 * 15), new Coordinate(-3 * 15, -1 * 15), new Coordinate(-1 * 15, 1 * 15), new Coordinate(-2 * 15, 3 * 15)}, 255));
    }
    
    Iterator<Asteroid> asteroidsIterator = asteroids.iterator();
    
    while(asteroidsIterator.hasNext()) {
      Asteroid asteroid = asteroidsIterator.next();
      asteroid.move();
      
      if (asteroid.isDeleted()) {
        asteroids.remove(asteroid);
        asteroidsIterator = asteroids.iterator();
        continue;
      }
      
      asteroid.show();
    }
    
    Iterator<Bullet> bulletsIterator = bullets.iterator();
    
    while(bulletsIterator.hasNext()) {
      Bullet bullet = bulletsIterator.next();
      bullet.move();
      
      if (bullet.isDeleted()) {
        bullets.remove(bullet);
        bulletsIterator = bullets.iterator();
        continue;
      }
      
      bullet.show();
    }
    
    player.move();
    player.show();
  } else if (gameState == 4) { // Game Over
     if (keysPressed.contains('m')) {
       gameState = 0;
       resetGame();
     } else {
       new AsteroidsFontText("GAME OVER\n\npress M to return to menu", 4, true, 15, 30).show(350, 350);
     }
  }
  
  asteroidsSpawnDelayTick++;
}

public void keyPressed() {
  if (key == CODED) {
    if (!codedKeysPressed.contains(keyCode)) {
      codedKeysPressed.add(keyCode);
    }
  } else if (!keysPressed.contains(key)) {
    keysPressed.add(key);
  }
}

public void keyReleased() {
  if (key == CODED) {
    codedKeysPressed.remove((Object) keyCode);
  } else {
    keysPressed.remove((Object) key);
  }
}

private void resetGame() {
  stars.clear();
  
  for (int i = 0; i < 50; i++) {
    stars.add(new Star(Math.random() * width, Math.random() * height, 10, 255));
  }
  
  asteroids.clear();
}
