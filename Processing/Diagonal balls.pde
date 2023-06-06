void setup() {
  size(600, 400);
}

void draw() {
  background(0);
  float col = 0;
  int numbBalls = 8; //set how many balls yu want on screen
  float w = width/numbBalls;
  float y = (height/numbBalls) / 2; //adjust so balls are alligned to window corner
  
  //spawn balls
  for (int i = 0; i <= numbBalls; i++) {
    float x = i * w + w/2;
    col += 255/numbBalls; //fix later for numbBalls > 255
    fill(col);
    ellipse(x, y, 30, 30);
    y += height/numbBalls; //lower ball after drawing each one
  }
}
