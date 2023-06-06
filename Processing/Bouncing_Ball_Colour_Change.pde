//Created By Lucas L for TEJ3MR course

float posY; //ball y
float posX; //ball x
float speed = random(1, 10); //how fast ball moves
int dirX = 1; //controls the direction of the movement
int dirY = 1; //controls the direction of the movement
int ballWidth = 80;
int ballHeight = 80;
int rad = ballWidth/2; //radius of ball used to prevent ball from phasing through window
boolean mouseTop;
int distanceThreshold = 50; //mouse must be less than this value to the ball in order for it to change to white

void setup() {
  size(600, 400);
  smooth(8);   //antialisasing x8 for smoother ball
  posX = width/2;
  posY = height/2;
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(0);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
  strokeWeight(5);
  ellipse(posX, posY, ballWidth, ballHeight);

  //move direction code
  posX += speed * dirX;
  posY += speed * dirY;
  if (posX >= width - rad || posX <= 0 + rad) { //if the ball reaches the edge of the screen
    dirX = dirX * -1; //reverse the direction
  } else if (posY >= height - rad|| posY <= 0 + rad) {
    dirY = dirY * -1;
  }

  //As an extra challenge the ball will change to white if the mouse is over top of it.
  if (dist(mouseX, mouseY, posX, posY) <= distanceThreshold) {
    mouseTop = true;
  } else {
    mouseTop = false;
  }

  //change colour quadrants if mouse not over
  if (mouseTop == false) {
    colourChange();
  } else {
    fill(#FFFFFF);
  }
 
  //debug distance from ball
  println("Distance: " + dist(mouseX, mouseY, posX, posY));
}

//Colourchange function, change color of ball based on screen position
void colourChange() {
  if (posX < width/2 && posY < height/2) {
    fill(255, 0, 0);
  } else if (posX > width/2 && posY < height/2) {
    fill(255, 255, 0);
  } else if (posX > width/2 && posY > height/2) {
    fill(#FFA500);
  } else {
    fill(0, 0, 255);
  }
}
