class SerialHelper {
  String serialValue;
  String[] direction;
  Serial port;

  SerialHelper(Serial p) {
    port = p;
  }

  void update(Joystick stick, Rod rod) {
    if ( port.available() > 0) {
      serialValue = port.readStringUntil('\n');
      direction = split(serialValue, ',');
      if (direction != null) {
        stick.handle(direction);
        if (direction.length == 4) {
          println("SerialHelper: "+ direction[3]);
          rod.handle(direction[3]);
        }
      }
    }
  }
}
