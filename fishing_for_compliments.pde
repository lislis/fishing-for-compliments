PImage img;  // Declare variable "a" of type PImage

PImage fish1, fish2, fish3, fish4;
PImage rod;

int waterTop = 70;

class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;

  int w = 35;
  int h = 25;

  Fish() {
    location = new PVector(random(-5, 0), random(80, 100));
    velocity = new PVector(random(1, 2), random(-1, 1));
  }

  void update() {
    location.add(velocity);
  }
  void display() {
    noFill();
    stroke(200, 30, 30);
    rect(location.x + (w/2), location.y + 3, w, h);
    noStroke();
    if (velocity.x >= 0) {
      image(img, location.x, location.y);
    } else {
      pushMatrix();
      translate(w * 2, 0);
      scale(-1, 1);
      image(img, -location.x, location.y);
      popMatrix();
    }
  }

  void checkEdges() {
    if (location.y <= waterTop) {
      location.y = waterTop;
      velocity.y = velocity.y * -1;
    }
    if (location.y >= height - h) {
      location.y = height - h;
      velocity.y = velocity.y * -1;
    }
    if (location.x >= width - w) {
      location.x = width - w;
      velocity.x = velocity.x * -1;
    }
    if (location.x <= 0) {
      location.x = 0;
      velocity.x = velocity.x * -1;
    }
  }
}



Fish redFish;


void setup() {
  size(640, 360);
  img = loadImage("Fish2.png");  // Load the image into the program
  redFish = new Fish();
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
}
