PImage img;  // Declare variable "a" of type PImage

PImage fish1, fish2, fish3, fish4;
PImage rod;

class Fish {
  PVector location;
  PVector velocity;

  Fish() {
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2), random(-2, 2));
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

void draw() {
  //image(img, 0, 0);
  background(255);
  redFish.update();
  redFish.display();
  //image(img, 0, height/2, img.width/2, img.height/2);
}
