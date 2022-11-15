import processing.sound.*;

Spaceship player = new Spaceship(4, new int[]{0, 2, 2, 0}, new int[]{0, 0, 2, 2}, 255);

public void setup() {
  size(500, 500);
  SoundFile file = new SoundFile(this, "song1.wav");
  file.play(1, 0.05);
}
public void draw() {
  player.show();
}
