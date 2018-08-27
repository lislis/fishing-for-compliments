class Joystick {
  boolean right;
  boolean left;
  boolean clicked;

  Joystick() {
    right = false;
    left = false;
    clicked = false;
  }

  void handle(String[] dir) {
    if (dir.length > 2) {
      if (int(dir[0]) == 0) {
        clicked = true;
      } else {
        clicked = false;
      }

      if (int(dir[1]) > 1000) {
        left = true;
      } else if (int(dir[1]) < 20) {
        right = true;
      } else {
        left = false;
        right = false;
      }
    }
  }
}
