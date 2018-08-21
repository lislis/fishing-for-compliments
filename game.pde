class Game {
  int state;
  int score = 0;
  PImage[] fishImg = new PImage[5];
  Fish[] fish;
  Compliment[] compliments; 
  Rod rod;

  Game(int amountFish) {
    state = 0;
    fish = new Fish[amountFish];
    compliments = new Compliment[amountFish];   
    spawnFish();
    rod = new Rod();
  }

  void display() {
    if (state == 0) {
      titlescreen();
    } else if (state == 1) {
      gameloop();
    } else if (state == 2) {
      endscreen();
    }
  }

  void endscreen() {
    drawBG();
    drawWater();
  }

  void titlescreen() {
    drawBG();
    drawWater();
    textSize(fontHeadlineSize);
    fill(51, 63, 66);
    text("Fishing for Compliments", 20, 90);
    textSize(fontBodySize);
    textLeading(fontBodySize * 1.5);
    text("Move joystick left and rigth to move the digital rod.", 20, 130, 350, 100);
    text("Move the physical rod up and down in liquid to sink and pull up the hook.", 20, 190, 350, 100);
    text("Move joystick up to start.", 20, 290, 350, 100);
  }

  void gameloop() {
    drawBG();
    drawStats();
    drawWater();

    rod.update();
    rod.display();
    updateFish();
    updateScore();
  }

  void updateScore() {
    score = 0;
    for (int i = 0; i < fish.length; i++) {
      if (fish[i].collided == true) {
        score ++;
      }
    }
    if (score == amountFish) {
      game.state = 2;
    }
  }

  void spawnFish() {
    for (int i = 0; i < fishImg.length; i++) {
      fishImg[i] = loadImage("Fish"+ i +".png");
    }
    for (int i = 0; i < fish.length; i++) {
      fish[i] = new Fish();
      compliments[i] = new Compliment();
    }
  }

  void updateFish() {
    for (int i = 0; i < fish.length; i++) {
      if (fish[i].collided == false) {
        fish[i].update();
        compliments[i].syncLoc(fish[i].location);
        fish[i].collidesWith(rod.hook);
        fish[i].display();
      } else {
        if (compliments[i].outside == false) {
          compliments[i].update();
          compliments[i].display();
        }
      }
    }
  }

  void drawBG() {
    background(174, 221, 232);
    noStroke();
  }

  void drawStats() {
    textAlign(LEFT);
    fill(51, 63, 66);
    textSize(fontBodySize);
    text("Compliments fished: "+ score, 10, 30);
  }

  void drawWater() {
    fill(65, 188, 216);
    rect(0, waterTop, width, height);
  }
}
