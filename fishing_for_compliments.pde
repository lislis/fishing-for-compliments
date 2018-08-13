PImage img;  // Declare variable "a" of type PImage
PImage fish1, fish2, fish3, fish4;

int waterTop = 70;

Fish redFish;
Rod rod;

void setup() {
  size(640, 360);
  img = loadImage("Fish2.png");
  redFish = new Fish();
  rod = new Rod();
}

void drawBG() {
  background(255);
  noStroke();
  fill(80, 80, 200);
}

void draw() {
  drawBG();
  rect(0, waterTop, width, height);
  redFish.update();
  redFish.checkEdges();
  redFish.display();

  rod.update();
  rod.display();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      rod.moveLeft();
    } else if (keyCode == RIGHT) {
      rod.moveRight();
    }
    if (keyCode == UP) {
      rod.moveUp();
    } else if (keyCode == DOWN) {
      rod.moveDown();
    }
  } 
}
