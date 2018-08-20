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
    background(255);
    noStroke();
  }

  void drawStats() {
    fill(10);
    textSize(20);
    text("Compliments fished: "+ score, 10, 20);
  }

  void drawWater() {
    fill(80, 80, 200);
    rect(0, waterTop, width, height);
  }
}
