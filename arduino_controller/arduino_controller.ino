//
// Have a 5 pin joystick module
// Connect 5V and GND
// X goes to A0
// Y goes to A1
// Switch goes to A2 // technically digital but what gives
//
// Have a 3 Pin water level sensor
// Connect 5V and GND
// Sensor goes to A3
//
// Then we basically just write to Serial
// for Processing to pick it up
//

int pinX = A0;
int pinY = A1;
int pinSwitch = A2;
int pinLed = 13;
int pinSensor = A3;
int sensorMin = 1023;
int sensorMax = 0;
int sensorValue;

void setup() {
  Serial.begin(9600);
  pinMode(pinX, INPUT);
  pinMode(pinY, INPUT);
  pinMode(pinLed, OUTPUT);
  pinMode(pinSwitch, INPUT_PULLUP);
  pinMode(pinSensor, INPUT);
  digitalWrite(pinLed, HIGH);

  // calibrate high and low
  while (millis() < 10000) {
    sensorValue = analogRead(pinSensor);
    if (sensorValue > sensorMax) {
      sensorMax = sensorValue;
    }
    if (sensorValue < sensorMin) {
      sensorMin = sensorValue;
    }
  }

  digitalWrite(pinLed, LOW);
}

void loop() {
  Serial.print(digitalRead(pinSwitch));
  Serial.print(",");
  Serial.print(analogRead(pinX));
  Serial.print(",");
  Serial.print(analogRead(pinY));
  Serial.print(",");
  Serial.print(analogRead(pinSensor));
  Serial.print(",");
  Serial.print(sensorMin);
  Serial.print(",");
  Serial.println(sensorMax);
  delay(50);
}
