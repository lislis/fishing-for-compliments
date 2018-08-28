class SerialHelper {
  String serialValue;
  String[] direction;
  Serial port;

  SerialHelper(Serial p) {
    port = p;
  }

  void update(Inputs inputs) {
    if ( port.available() > 0) {
      serialValue = trim(port.readStringUntil('\n'));
      if (serialValue != null) {
        direction = split(serialValue, ',');
        //println(direction);
        if (direction.length == 6) {
          // 0 clicked
          // 1 x axis
          // 2 y axis
          // 3 sensor value
          // 4 sensor min
          // 5 sensor max
          inputs.handle(direction);
        }
      }
    }
  }
}
