class Compliment {
  PVector location;
  PVector velocity;
  PVector acceleration;
  String text;
  boolean outside;
  String[] pool = loadStrings("compliments.txt");
  int alpha;

  Compliment() {
    location = new PVector(0, 0);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    text = pool[floor(random(pool.length))];
    outside = false;
  }

  void syncLoc(PVector loc) {
    location = loc;
  }

  void display() {
    textSize(fontBodySize * 1.2);
    fill(250, alpha);
    textAlign(CENTER);
    text(text, location.x, location.y, 200, 400);
  }

  void update() {
    acceleration = new PVector(0, 0.01);
    velocity.add(acceleration);
    location.add(velocity);
    alpha = (int) map(location.y, waterTop, height, 255, 0);
    checkForEnd();
  }

  void checkForEnd() {
    if (location.y > height) {
      outside = true;
    }
  }
}
