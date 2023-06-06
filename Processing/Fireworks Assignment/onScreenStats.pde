//fun firework simulation stats to show the user
int fireworkCount;
int txtSize = 14; //text size

void showFPSCounter() {
  textSize(txtSize); //sets font size of all text
  fill(0, 0, 255); //ensure color remains white
  text("FPS: " + frameRate, width/50, height/25); //independent of screen size, draws text on top left corner of window
}

//each time a firework is added, fireworkCount increments by 1
void showFireworkCount() {
  textSize(txtSize); //sets font size of all text
  fill(0, 0, 255); //ensure text color remains white
  text("Fireworks launched: " + fireworkCount, width/50, height/12);
}

void showParticleCount() {
  textSize(txtSize); //sets font size of all text
  fill(0, 0, 255); //ensure text color remains white
  text("Explosion particles onscreen: " + (circleParticleList.size()+angledCircleParticleList.size()), width/50, height/8); //string, particlecount according to
}

//one function that shows all stats - simplifies code
void showAllStats() {
  textSize(txtSize); //sets font size of all text
  showFPSCounter();
  showFireworkCount();
  showParticleCount();
}
