import gab.opencv.*;
import processing.video.*;
Movie myMovie;
OpenCV opencv;

void setup() {
  size(720, 480);
  frameRate(30);
  myMovie = new Movie(this, "rub_1.mov");
  opencv = new OpenCV(this, 720, 480);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  myMovie.speed(5.0);
  myMovie.loop();
}

void draw() {
  if(myMovie.available()){
  image(myMovie, 0, 0);
  print(myMovie.height);
  print(myMovie.width);

  opencv.loadImage(myMovie);
  
  
  opencv.updateBackground();
   
  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
  }
}

void movieEvent(Movie m) {
  m.read();
}