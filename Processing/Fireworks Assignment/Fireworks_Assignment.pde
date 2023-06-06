//Lucas Leung
//Fireworks display project
//TEJ3M - May 7, 2023
//
//TODO:
//add comments
//add multiple explosion types
//add pattern/timed explosion
//try to just have one particle list, rather than creating multiple. would massively save time/effort

//setup variables and arrays
int bgColor = 0; //black background
ArrayList<firework> fireworkList; //fireworkList defined as a list with type firework clas
ArrayList<circleParticle> circleParticleList; //circleParticleList defined as a list with type circleparticle class
ArrayList<angledCircleParticle> angledCircleParticleList;

void setup() {
  size(800, 600, P2D); //p2d rendering mode for faster performance
  colorMode(HSB); //colormode is HSB
  smooth(); //smoothes every shape
  noStroke(); //no stroke (outline) on any shape for added realism
  rectMode(CENTER);
  fireworkList = new ArrayList<firework>(); //arraylist will accept new firework objects
  circleParticleList = new ArrayList<circleParticle>(); //arraylist will accept new circle particle objects
  angledCircleParticleList = new ArrayList<angledCircleParticle>(); //arraylist will accept new angled circle particle objects
}

void draw() {
  background(bgColor);

  //FIREWORK
  fireworkCode(); //inside firework file

  //MOVE & DISPLAY PARTICLES - inside particles file
  circleParticleCode();
  angledCircleParticleCode();

  //display informational text on screen - inside onScreenStats file
  showAllStats();
}

void mousePressed() {
  fireworkLaunchMousePressed(); //launch firework if mouse pressed - inside firework file
}

void keyPressed() {
  //press space to launch the firework
  if (key == ' ') {
    //f is a new firework object
    fireworkList.add(new firework(random(0, width), height, 5, 10, 255, random((height/9), (height/2)), -7));
    playLaunchSound();
    fireworkCount++;
  }

  //save screenshot to sketch folder by pressing s key
  if (key == 's' || key == 'S') {
    //use current time as file name
    save(year()+"_"+month()+"_"+day()+"_"+hour()+""+minute() + ".png");
    playScreenshotSound(); //play screenshot sound
  }

  //pressing m key mutes/unmutes SFX, works like a toggle
  if ((key == 'm' && muted == false) || (key == 'M' && muted == false)) {
    muted = true;
  } else if ((key == 'm' && muted == true) || (key == 'M' && muted == true)) {
    muted = false;
  }

//pressing a will generate a random explosion at the mouse location
  if ((key == 'a' || key == 'A')) {
    playRandomExplosionSound();
     //choose a random explosion to display and random size
    int randomExplosion = (int)(random(1, 6));
    int randomSize = (int)(random(15, 50));
    if (randomExplosion == 1) {
      createSquareExplosion(mouseX, mouseY, randomSize, randomSize);
    } else if (randomExplosion == 2) {
      createLowGravitySquareExplosion(mouseX, mouseY, randomSize, randomSize);
    } else if (randomExplosion == 3) {
      createRadialExplosion(mouseX, mouseY, randomSize, randomSize);
    } else if (randomExplosion == 4) {
      createSemiCircleExplosion(mouseX, mouseY, randomSize, randomSize);
    } else if (randomExplosion == 5) {
      createWhiteCircleExplosion(mouseX, mouseY, randomSize, randomSize);
    }
  }
}
