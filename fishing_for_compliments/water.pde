class Water {  
  float xoff;
  float yoff;
  float time;

  Water() {
    xoff = 1000;
    yoff = 100000;
    time = 0.0;
  }

  void update() {
    xoff += 0.01;
    yoff += 0.01;
    time += 0.1;
  }

  void display() {
    drawBG();
    drawWater();
  }

  void drawBG() {
    background(174, 221, 232);
    noStroke();
  }

  void drawWater() {
    loadPixels();
    for (int x = 0; x < width; x+=4) {
      for (int y = 0; y < height; y+=4) {
        noiseDetail(6);
        float bright = map(noise(x, y, time), 0, 1, 100, 255); 
        pixels[x+y*width] = color(bright);
      }
    }
    updatePixels();

    fill(65, 188, 216, 120);
    rect(0, waterTop, width, height);

    noiseDetail(4);
    beginShape();
    vertex(0, waterTop);
    for (int i = 0; i <= width; i += 10) {
      float y = noise(xoff, yoff, i) * 20;
      curveVertex(i, y + waterTop - 15);
    }
    vertex(width, waterTop);
    vertex(width, waterTop );
    endShape(CLOSE);
  }
}
