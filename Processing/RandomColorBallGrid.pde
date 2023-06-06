int numofcircles = 5;
float spacingX;
float spacingY;
int ii;
float[] col; //color array

void setup() {
  size(600, 400);
  colorMode(HSB); //hue saturation black
  spacingX = width/numofcircles;
  spacingY = height/numofcircles;

  //create random color array
  col = new float[25];
  for (int i = 0; i < 25; i++) {
    col[i] = random(0, 255);
  }
}

void draw() {
  background(0);
  for (int x = 0; x < numofcircles; x++) {
    for (int y = 0; y < numofcircles; y++) {
      //this second for loop runs 5 times for each time the first loop runs. This means it will currently run a total of 25 times
      float posX = spacingX * x  + spacingX/2;
      float posY = spacingY * y + spacingY/2;
      fill(col[ii], 255, 255);
      ellipse(posX, posY, 50, 50);
      ii++;
    }
  }

  println(ii); //debug to print HSB color value of each item in array used for rand color
}
