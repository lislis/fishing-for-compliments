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
