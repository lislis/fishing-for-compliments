int waterTop = 70;
Rod rod;

PImage[] fishImg = new PImage[5];
Fish[] fish = new Fish[5];


void setup() {
  size(640, 360);
  for (int i = 0; i < fishImg.length; i++) {
    fishImg[i] = loadImage("Fish"+ i +".png");
  }
  for (int i = 0; i < fish.length; i++) {
    fish[i] = new Fish();
  }
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

  for (int i = 0; i < fish.length; i++) {
    fish[i].update();
    fish[i].collidesWith(rod.hook);
    fish[i].checkEdges();
    fish[i].display();
  }
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
