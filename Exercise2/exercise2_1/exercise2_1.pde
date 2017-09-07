  
import processing.video.*;
Movie myMovie;

void setup() {
  size(720, 480);
  frameRate(30);
  myMovie = new Movie(this, "rub_1.mov");
  myMovie.speed(50.0);
  myMovie.play();
}

void draw() {
  image(myMovie, 0, 0);
}

void movieEvent(Movie m) {
  m.read();
}