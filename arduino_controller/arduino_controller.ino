//
// Have a 5 pin joystick module
// Connect 5V and GND
// X goes to A0
// Y goes to A1
// Switch goes to 3
//
// Then we basically just write to Serial 
// for Processing to pick it up
//

int pinX = A0;
int pinY = A1;
int pinSwitch = 3;
int pinLed = 13;

void setup() {
  Serial.begin(9600);
  pinMode(pinX, INPUT);
  pinMode(pinY, INPUT);
  pinMode(pinLed, OUTPUT);
  pinMode(pinSwitch, INPUT_PULLUP);
  digitalWrite(pinLed, HIGH);
}

void loop() {
  Serial.print(digitalRead(pinSwitch));
  Serial.print(",");
  Serial.print(analogRead(pinX));
  Serial.print(",");
  Serial.println(analogRead(pinY));
  delay(100);
}
