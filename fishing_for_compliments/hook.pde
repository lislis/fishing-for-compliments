class Hook {
  PVector location;
  PVector velocity;
  PVector acceleration;
  int topspeed;
  float mass;

  PVector wind;

  int w = 20;
  int h = 20;
  float line = 80;

  Hook(float x, float y) {
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topspeed = 3;
    mass = 3;

    wind = new PVector(0, 0);
  }

  void update() {
    float c = 0.01;
    PVector friction = velocity;
    friction.mult(-1);
    friction.normalize();
    friction.mult(c);

    applyForce(wind);
    applyForce(friction);
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    acceleration.mult(0);

    checkEdges();
    checkLine();
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  void updateWindX(float x) {
    wind.x = x;
  }
  void updateWindY(float y) {
    wind.y = y;
  }
  void updateLine(float x) {
    line += x;
    if (line >= height) {
      line = height;
    }
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
    fill(200, 50, 50);
    ellipse(location.x + (w /2), location.y + (h / 2), w, h);
    //rect(location.x, location.y, w, h);
    noFill();
  }
}
