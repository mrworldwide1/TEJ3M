int mouseClickExplodeDist = 35; //how close mouse has to be to manually explode fireworks

//firework class is the ball that flies up before causing an explosion of particles
class firework {
  //define variables
  float x; //xPos
  float y; //yPos
  float w; //width
  float h; //height
  int col; //hue color
  float maxHeight; //height, the y-value that reached before exploding
  float speedY; //how fast it goes up the screen

  //the constructor, arguments that can be passed through. these are temporary variables
  firework(float _x, float _y, float _w, float _h, int _col, float _maxHeight, float _speedY) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    col = _col;
    maxHeight = _maxHeight;
    speedY = _speedY;
  }

  //draw circle shape on screen
  void display() {
    fill(col); //white color
    ellipse(x, y, w, h); //draw firework shape based on constructor variables
    circleParticleList.add(new circleParticle(x, y+h, w, h, random(-1, 1), random(0.01, 0.02), 0.1, 0.4, 255, 0, 255, 255, (int)random(4, 8))); //draw particle trail just below firework
  }

  //move up screen
  void move() {
    y += speedY;
  }

  //explode and go boom when firework reaches its max height
  boolean maxHeightReached() {
    if (y <= maxHeight) {
      return true;
    } else {
      return false;
    }
  }
}

//**responsible for all firework functionality**
//this function displays and moves the firework, and creates random explosion when firework reaches max height
void fireworkCode() {
  for (int i = fireworkList.size()-1; i >= 0; i--) {
    firework f = fireworkList.get(i);
    f.display(); //The '.' allow you to access methods and variables of the object
    f.move();

    //Check if we should remove each firework from the list
    if (f.maxHeightReached()) {
      fireworkList.remove(i); //remove fireworks from arraylist
      playRandomExplosionSound();

      //choose a random explosion to display and random size
      int randomExplosion = (int)(random(1, 6));
      int randomSize = (int)(random(15, 50));
      if (randomExplosion == 1) {
        createSquareExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 2) {
        createLowGravitySquareExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 3) {
        createRadialExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 4) {
        createSemiCircleExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 5) {
        createWhiteCircleExplosion(f.x, f.y, randomSize, randomSize);
      }
    }
  }
}

//this function launches fireworks when mouse is clicked
void fireworkLaunchMousePressed() {
  fireworkList.add(new firework(mouseX, height, 5, 10, 255, random((height/9), (height/2)), -7)); //f is a new firework object, passing in these arguments to constructor
  playLaunchSound();
  fireworkCount++;

  //continuously compare each firework object's x and y to mouseX and mouseY
  for (int i = fireworkList.size()-1; i >= 0; i--) {
    firework f = fireworkList.get(i);
    if (dist(mouseX, mouseY, f.x, f.y) <= mouseClickExplodeDist) {
      fireworkList.remove(i); //remove firework
      playRandomExplosionSound();

      //choose a random explosion to display and random size
      int randomExplosion = (int)(random(1, 6));
      int randomSize = (int)(random(15, 50));
      if (randomExplosion == 1) {
        createSquareExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 2) {
        createLowGravitySquareExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 3) {
        createRadialExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 4) {
        createSemiCircleExplosion(f.x, f.y, randomSize, randomSize);
      } else if (randomExplosion == 5) {
        createWhiteCircleExplosion(f.x, f.y, randomSize, randomSize);
      }
    }
  }
}
