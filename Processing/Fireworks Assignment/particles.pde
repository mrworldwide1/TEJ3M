// particle classes define different types of particles(shapes)

class circleParticle {
  float x; //xPos
  float y; //yPos
  float w; //width
  float h; //height
  float moveX;//initial x speed
  float moveY; //initial y speed
  float grav; //initial gravity
  float gravAccel; //added gravity on top of grav, displaying realistic downward acceleration
  float hue; //hue, color
  float sat; //saturation
  float black; //black value
  int a; //alpha transparency
  int alphaDecrease; //how fast the particles fade out

  //constructor
  circleParticle(float _x, float _y, float _w, float _h, float _moveX, float _moveY, float _grav, float _gravAccel, float _hue, float _sat, float _black, int _a, int _alphaDecrease) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    moveX = _moveX;
    moveY = _moveY;
    grav = _grav;
    gravAccel = _gravAccel;
    hue = _hue;
    sat = _sat;
    black = _black;
    a = _a;
    alphaDecrease = _alphaDecrease; //random value to change alpha by
  }

  void display() {
    a -= alphaDecrease; //subtract alpha to cause particle fade out over time - runs each frame the particle appears on screen
    fill(hue, sat, black, a); //4th arg is alpha
    ellipse(x, y, w, h);
  }

  //moves the explosion particles
  void move() {
    x+=moveX;
    grav += gravAccel;
    y += moveY + grav;
  }

  boolean kill() { //clears particles from the list when they fully fade out according to alpha
    if (a >= 1) {
      return false;
    } else {
      return true;
    }
  }
}


//angled circle particle class that moves out in circle
class angledCircleParticle {
  float x; //xPos
  float y; //yPos
  float speed;
  float angle;
  float w; //width
  float h; //height
  float grav; //initial gravity
  float gravAccel; //added gravity on top of grav, displaying realistic downward acceleration
  float hue; //hue, color
  float sat; //saturation
  float black; //black value
  int a; //alpha transparency
  int alphaDecrease; //how fast the particles fade out

  //constructor
  angledCircleParticle(float _x, float _y, float _speed, float _angle, float _w, float _h, float _grav, float _gravAccel, float _hue, float _sat, float _black, int _a, int _alphaDecrease) {
    x = _x;
    y = _y;
    speed = _speed;
    angle = _angle;
    w = _w;
    h = _h;
    grav = _grav;
    gravAccel = _gravAccel;
    hue = _hue;
    sat = _sat;
    black = _black;
    a = _a;
    alphaDecrease = _alphaDecrease; //random value to change alpha by
  }

  //display circle with angle
  void display() {
    a -= alphaDecrease; //subtract alpha to cause particle fade out over time - runs each frame the particle appears on screen
    fill(hue, sat, black, a); //4th arg is alpha
    ellipse(x, y, w, h);
  }

  //move the explosion particle using trigonometry
  void move() {
    x += cos(angle) * speed;
    y += sin(angle) * speed;
    //gravity moves particles down the screen
    grav += gravAccel;  //accelerates gravity
    y += grav;
  }

  boolean kill() { //clears particles from the list when they fully fade out according to alpha
    if (a >= 1) {
      return false;
    } else {
      return true;
    }
  }
}

//this function moves and displays each circle particle stored in circleParticleList
void circleParticleCode() {
  for (int i = circleParticleList.size()-1; i >= 0; i--) {
    circleParticle p = circleParticleList.get(i); //like int [var], the datatype is just the circleParticle class
    p.display();
    p.move();
    //Check if we should remove each ball from the list
    if (p.kill() == true) {
      circleParticleList.remove(i);
    }
  }
}

//this function moves and displays each angled circle particle stored in angledCircleParticleList
void angledCircleParticleCode() {
  for (int i = angledCircleParticleList.size()-1; i >= 0; i--) {
    angledCircleParticle p = angledCircleParticleList.get(i); //p is angledCircleParticle object
    p.display();
    p.move();
    //Check if we should remove each angled ball particle from the list
    if (p.kill() == true) {
      angledCircleParticleList.remove(i);
    }
  }
}
