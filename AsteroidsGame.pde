Spaceship player = new Spaceship(4, new int[]{0, 2, 2, 0}, new int[]{0, 0, 2, 2}, 255);

public void setup() {
  size(500, 500);
}
public void draw() {
  player.show();
}
