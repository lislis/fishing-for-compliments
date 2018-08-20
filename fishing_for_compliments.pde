int waterTop = 70;
int amountFish  = 10;

Game game;

void setup() {
  size(640, 360);
  game = new Game(amountFish);
}

void draw() {
  game.display();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      game.rod.moveLeft();
    } else if (keyCode == RIGHT) {
      game.rod.moveRight();
    }
    if (keyCode == UP) {
      game.rod.moveUp();
    } else if (keyCode == DOWN) {
      game.rod.moveDown();
    }
  }
}
