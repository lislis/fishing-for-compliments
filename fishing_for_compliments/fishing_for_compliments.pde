import processing.sound.*;
import processing.serial.*;

SoundFile waves;
SoundFile jazzloop;
SoundFile collect;
SoundFile menu;
SoundFile win;
Serial port;

boolean controller = true;

int waterTop = 70;
int amountFish  = 23;
int fontBodySize = 20;  
int fontHeadlineSize = 42;
PFont font;
Game game;
SerialHelper sh;

void setup() {
  //fullScreen();
  size(640, 400);
  font = createFont("Acme-Regular.ttf", fontBodySize);
  textFont(font);
  waves = new SoundFile(this, "ambient-waves.mp3");
  jazzloop = new SoundFile(this, "jazz-loop.mp3");
  collect = new SoundFile(this, "boom.mp3");
  menu = new SoundFile(this, "blip.wav");
  win = new SoundFile(this, "win.mp3");

  game = new Game(amountFish);
  if (controller) {
    port = new Serial(this, Serial.list()[0], 9600);
    sh = new SerialHelper(port);
  }
}

void draw() {
  game.display();
  if (controller) {
    sh.update(game.inputs);
  }
}

void setGameloopState() {
  game.state = 1;
  menu.play();
  delay(200);
  jazzloop.loop();
}

void setTitlescreenState() {
  game.state = 0;
  game.reset();
  menu.play();
  delay(200);
  jazzloop.stop();
}

void keyPressed() {
  if (key == CODED) {
    if (!controller) {
      if (game.state == 0 && keyCode == UP) {
        setGameloopState();
      }
      if (game.state == 2 && keyCode == UP) {
        setTitlescreenState();
      }
    }

    if (game.state == 1) {
      if (keyCode == LEFT) {
        game.rod.moveLeft();
      } else if (keyCode == RIGHT) {
        game.rod.moveRight();
      }

      if (keyCode == UP) {
        game.rod.moveUp();
      } else if (keyCode == DOWN) {
        game.rod.moveDown();
      }
    }
  }
}
