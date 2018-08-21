class SerialHelper {
  String serialValue;
  String[] direction;
  Serial port;

  SerialHelper(Serial p) {
    port = p;
  }

  void update(Joystick stick) {
    if ( port.available() > 0) {
      serialValue = port.readStringUntil('\n');
      direction = split(serialValue, ',');
      if (direction != null) {
        stick.handle(direction);
      }
    }
  }
}
