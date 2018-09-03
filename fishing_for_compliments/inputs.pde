class Inputs {
  boolean calibrate;
  boolean right;
  boolean left;
  boolean clicked;
  int xAxisThesholdMin = 150;
  int xAxisThesholdMax = 870;
  int level;
  int levelMin;
  int levelMax;
  boolean up;
  boolean down;

  Inputs() {
    calibrate = true;
    right = false;
    left = false;
    clicked = false;
    level = waterTop;
    levelMin = 0;
    levelMax = 0;
    up = false;
    down = false;
  }

  void handle(String[] dir) {
    // note:
    // SerialHelper makes sure that dir.length == 6
    handleClick(int(dir[0]));
    handleXAxis(int(dir[1]));
    // not handling yAxis aka dir[2]
    handleWaterLevel(int(dir[3]), int(dir[4]), int(trim(dir[5])));
  }

  void handleWaterLevel(int value, int min, int max) {
    level = value;
    levelMin = min;
    levelMax = max;
    // sort of dynamixcally adjust thresholds
    int delta = levelMax - levelMin;
    int threshold = delta / 3;
    //println(level, levelMin, levelMax, delta, threshold);
    
    if (level > levelMax - threshold) {
      down = true;
      up = false;
    } else if (level < levelMin + threshold) {
      down = false;
      up = true;
    } else {
      up = false;
      down = false;
    }
  }

  void handleXAxis(int value) {
    if (value > xAxisThesholdMax) {
      left = true;
      right = false;
    } else if (value < xAxisThesholdMin) {
      right = true;
      left = false;
    } else {
      left = false;
      right = false;
    }
  }

  void handleClick(int value) {
    if (value == 0) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
