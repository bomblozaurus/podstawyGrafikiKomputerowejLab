class SpaceshipController {
  Spaceship spaceship;

  SpaceshipController(Spaceship spaceship) {
    this.spaceship = spaceship;
  }

  void keyTyped() {
    println("TYPED");
    if (key == 'A') {
      println("A");
      spaceship.posX += 1;
    }
  }

  void keyPressed() {
    println("PRESSED");
  }
}
