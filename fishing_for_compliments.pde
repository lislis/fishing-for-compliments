PImage img;  // Declare variable "a" of type PImage

PImage fish1, fish2, fish3, fish4;
PImage rod;

class Fish {
  PVector location;
  PVector velocity;

  Fish() {
    location = new PVector(random(-5, 0), random(50, 100));
    velocity = new PVector(random(1, 2), random(-1, 1));
  }

  void update() {
    location.add(velocity);
    
  }
  void display() {
    image(img, location.x, location.y);
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
  rect(0, 70, width, height);
  redFish.update();
  redFish.display();
}
