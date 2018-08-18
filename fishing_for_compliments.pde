class Game {
  int state;
  Game() {
    state = 0;
  }

  void display() {
    drawBG();
    drawStats();
    drawWater();
  }


  void drawBG() {
    background(255);
    noStroke();
  }

  void drawStats() {
    fill(10);
    textSize(20);
    text("Compliments fished: "+ score, 10, 20);
  }

  void drawWater() {
    fill(80, 80, 200);
    rect(0, waterTop, width, height);
  }
}


Game game;

int waterTop = 70;
int score = 0;
Rod rod;

PImage[] fishImg = new PImage[5];
Fish[] fish = new Fish[5];
Compliment[] compliments = new Compliment[5]; 


void setup() {
  game = new Game();
  size(640, 360);
  for (int i = 0; i < fishImg.length; i++) {
    fishImg[i] = loadImage("Fish"+ i +".png");
  }
  for (int i = 0; i < fish.length; i++) {
    fish[i] = new Fish();
    compliments[i] = new Compliment();
  }
  rod = new Rod();
}


void draw() {
  game.display();
  
  for (int i = 0; i < fish.length; i++) {
    if (fish[i].collided == false) {
      fish[i].update();
      compliments[i].syncLoc(fish[i].location);
      fish[i].collidesWith(rod.hook);
      fish[i].checkEdges();
      fish[i].display();
    } else {
      if (compliments[i].outside == false) {
        compliments[i].update();
        compliments[i].display();
      }
    }
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
