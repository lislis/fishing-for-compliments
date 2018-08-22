class Rod {
  PVector location;
  Hook hook;

  float w = 10; 
  float h = 30;

  Rod() {
    location = new PVector(width / 2, 0);
    hook = new Hook(location.x - 5, waterTop - 10);
  }

  void update() {
    hook.update();
    checkEdges();
  }

  void display() {
    fill(51, 63, 66);
    rect(location.x, location.y, w, h);
    noFill();
    stroke(50);
    bezier(location.x + (w/2), h, location.x, h + 30, hook.location.x, hook.location.y - 40, hook.location.x + (hook.w / 2), hook.location.y + (hook.h / 2));
    noStroke();
    hook.display();
  }

  void moveLeft() {
    location.x -= 5;
    hook.updateWindX(-3);
  }

  void moveRight() {
    location.x += 5;
    hook.updateWindX(3);
  }

  void moveUp() {
    hook.updateLine(-3.5);
  }

  void moveDown() {
    hook.updateLine(10);
    hook.updateWindY(3);
  }
  
  void checkEdges() {
    if (location.x >= width - w) {
      location.x = width - w;
    }
    if (location.x <= 0) {
      location.x = 0;
    }
  }
}
