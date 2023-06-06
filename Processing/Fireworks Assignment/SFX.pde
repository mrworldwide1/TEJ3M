//import sound library and define variables
import processing.sound.*;
SoundFile File;
boolean muted = false;

//play firework explosion sound if simulation isnt muted, file used is pop.wav in the sketch folder
void playPopSound() {
  if (muted == false) {
    File = new SoundFile(this, "pop.wav");
    File.play();
  }
}

void playLoudBoomSound() {
  if (muted == false) {
    File = new SoundFile(this, "loudBoom.mp3");
    File.play();
  }
}

//play firework launch sound if simulation isnt muted, file used is fireworkLaunch.wav in the sketch folder
void playLaunchSound() {
  if (muted == false) {
    File = new SoundFile(this, "fireworkLaunch.wav");
    File.play();
  }
}

//play camera sound when screenshot is taken
void playScreenshotSound() {
  if (muted == false) {
    File = new SoundFile(this, "camerashutter.wav");
    File.play();
  }
}

//choose and play a random explosion sound
void playRandomExplosionSound() {
  int randSound = (int)(random(1, 3));
  if (randSound == 1) {
    playPopSound();
  } else if (randSound == 2) {
    playLoudBoomSound();
  }
}
