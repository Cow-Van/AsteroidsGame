private Spaceship player = new Spaceship(4, new int[]{0, 2, 2, 0}, new int[]{0, 0, 2, 2}, 255);
private GameState gameState = GameState.HOME;

public void setup() {
  size(500, 500);
}
public void draw() {
  player.show();
  
  switch (gameState) {
    case HOME:
      System.out.println("Home");
      break;
    case EDIT:
      break;
    case PLAY:
      break;
    case GAME_OVER:
      break;
  }
}

private enum GameState {
  HOME,
  EDIT,
  PLAY,
  GAME_OVER,
}
