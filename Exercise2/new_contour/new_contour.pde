

//Earl Mark, 2_16_17 modified libr. example

import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;

void setup() {
  size(720, 480);
  video = new Movie(this, "rub_1.mov");
  opencv = new OpenCV(this, 720, 480);
  
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
  //video.loop();
  video.play();
}

void draw() {
  if(video.height>0){
  image(video, 0, 0);  
  opencv.loadImage(video);
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
  for (int j = 0; j < height; j++){
    for(int i = 0; i < width; i++){
      color pix1 = get(i, j); //color of image
      if (brightness(pix1) > 120){ //if brightness less greater than 126
        float value = brightness(pix1);
        color c = color(int(value));
        set(i, j, c);
      }
    }
  }
  saveFrame("frames/brightFilt_######.jpg");
  }
}

void movieEvent(Movie m) {
  m.read();
}