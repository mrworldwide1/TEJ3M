int numofcircles = 5;
float spacingX;
float spacingY;
float[] col; //color array

void setup() {
  size(600, 400);
  colorMode(HSB); //hue saturation black
  spacingX = width/numofcircles;
  spacingY = height/numofcircles;

  //create colour array. we need to set each element in the array to a starting value
  col = new float[120];
  for (int i = 0; i < 120; i++) {
    col[i] = i;
  }
}

void draw() {
  println(col);
  background(0);
  for (int x = 0; x < numofcircles; x++) {
    for (int y = 0; y < numofcircles; y++) {
      //this second for loop runs 5 times for each time the first loop runs. This means it will currently run a total of 25 times
      float posX = spacingX * x  + spacingX/2;
      float posY = spacingY * y + spacingY/2;      
      float d = dist(mouseX, mouseY, posX, posY);

    if (d < 25) {
      fill(col[0], 255, 255); //get the item in the list and set it to 0
      //remember that x is the 'index' this is the address
    } else {
      fill(col[119], 255, 255);
    }
      ellipse(posX, posY, 50, 50);
    }
  }
}
