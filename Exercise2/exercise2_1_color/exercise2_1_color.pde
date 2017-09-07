/**
 * Pixelate  
 * by Hernando Barragan.  
 * 
 * Load a QuickTime file and display the video signal 
 * using rectangles as pixels by reading the values stored 
 * in the current video frame pixels array. 
 */

import processing.video.*;

Movie mov;
color movColors[];

void setup() {
  size(720, 480);
  noStroke();
  mov = new Movie(this, "rub_1.mov");
  mov.loop();
  movColors = new color[height * width];
}

void draw() {
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();

  background(255);
  for (int j = 0; j < height; j++) {
    for (int i = 0; i < width; i++) {
      //fill(movColors[j*width + i]);
      float value = brightness(mov.get(i,j));
      color c = color(int(value));
      set(i, j, c);
    }
  }
    
 // saveFrame("frames/gray-####.jpeg");
  }

}