class Fish {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int topspeed;
  float xoff;
  float yoff;
  int w = 35;
  int h = 25;

  Fish() {
    location = new PVector(random(width), random(waterTop, height));
    velocity = new PVector(0, 0);
    acceleration = PVector.random2D();
    xoff = random(0, 10000);
    yoff = random(0, 10000);
    topspeed = 2;
  }

  void update() {
    float noisex = map(noise(xoff, yoff), 0, 1, -1, 1);
    float noisey = map(noise(yoff, xoff), 0, 1, -1, 1);
    acceleration = new PVector(noisex, noisey);
    //acceleration = new PVector(1, 1);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    xoff += 0.01;
    yoff += 0.01;
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
    if (location.y >= height - (h + 5)) {
      location.y = height - (h + 5);
      velocity.y = velocity.y * -1;
    }
    if (location.x >= width - (w * 1.5)) {     
      location.x = width - (w * 1.5);
      velocity.x = velocity.x * -1;
    }
    if (location.x <= 0 - (w/2)) {
      location.x = -w/2;
      velocity.x = velocity.x * -1;
    }
  }
}
