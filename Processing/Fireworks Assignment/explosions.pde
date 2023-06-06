//TODO:
//add more unique explosions

//create random colored square explosion
void createSquareExplosion(float posX, float posY, int w, int h) { //w is width and h is height of each explosion particle/shape
  int maxParticles = ((int)random(50, 500)); //random num of particles created
  for (int i = 0; i < maxParticles; i++) {
    circleParticleList.add(new circleParticle(posX, posY, w, h, random(-5, 5), random(-5, 5), 0.1, 0.4, random(0, 255), random(200, 255), 255, 255, (int)random(2, 8)));
    //the 2 random values are responsible for the random movement into the ball construc. each ball particle will move at random speed
  }
}

//create low gravity randomly colored square
void createLowGravitySquareExplosion(float posX, float posY, int w, int h) { //w is width and h is height
  int maxParticles = ((int)random(50, 500)); //random num of particles created
  for (int i = 0; i < maxParticles; i++) {
    circleParticleList.add(new circleParticle(posX, posY, w, h, random(-1, 1), random(-1, 1), 0.01, 0.01, random(0, 255), random(200, 255), 255, 255, (int)random(2, 8)));
  }
}

//create radial random color explosion with ellipses
void createRadialExplosion(float posX, float posY, int w, int h) { //w is width and h is height
  int maxParticles = ((int)random(50, 500)); //random num of particles created
  for (int i = 0; i < maxParticles; i++) {
    angledCircleParticleList.add(new angledCircleParticle(posX, posY, random(3, 9), random(0, TWO_PI), w, h, 0.1, 0.1, random(0, 255), random(200, 255), 255, 255, (int)random(2, 8)));
  }
}

//create semi-circle random color explosion with ellipses
void createSemiCircleExplosion(float posX, float posY, int w, int h) { //w is width and h is height
  int maxParticles = ((int)random(50, 500)); //random num of particles created
  for (int i = 0; i < maxParticles; i++) {
    angledCircleParticleList.add(new angledCircleParticle(posX, posY, random(6, 9), random(0, PI), w, h, 0.2, 0.4, random(0, 125), random(200, 255), 255, 255, (int)random(2, 8)));
  }
}

//create white color explosion with ellipses
void createWhiteCircleExplosion(float posX, float posY, int w, int h) { //w is width and h is height
  int maxParticles = ((int)random(50, 500)); //random num of particles created
  for (int i = 0; i < maxParticles; i++) {
    circleParticleList.add(new circleParticle(posX, posY, w, h, random(-3, 3), random(-0.01, 0.01), 0, 0, 255, 0, 255, 255, (int)random(4, 8)));
  }
}
