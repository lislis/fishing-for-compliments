class Hook {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int topspeed;

  int w = 20;
  int h = 20;
  float line = 80;

  Hook(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 3;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    velocity.x = 0;

    checkEdges();
    checkLine();
  }
  void updateAccX(float x) {
    acceleration.x = x;
  }
  void updateAccY(float y) {
    acceleration.y = y;
  }
  void updateLine(float x) {
    line += x;
    if (line >= height) {
      line = height;
    }
    acceleration.y = 0;
  }

  void checkLine() {
    if (location.y >= line) {
      location.y = line;
      // weird flying hook bug
      if (location.y <= waterTop - (h / 2)) {
        location.y = waterTop - (h / 2);
      }
    }
  }

  void checkEdges() {
    if (location.y <= waterTop - (h / 2)) {
      location.y = waterTop - (h / 2);
    }
    if (location.y >= height - h) {
      location.y = height - h;
    }
    if (location.x >= width - w) {
      location.x = width - w;
    }
    if (location.x <= 0) {
      location.x = 0;
    }
  }

  void display() {
    noStroke();
    fill(20, 300, 30);
    rect(location.x, location.y, w, h);
    noFill();
  }
}
