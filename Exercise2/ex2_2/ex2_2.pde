import processing.video.*;
import java.util.*;

Movie movie1;
Movie movie2;
Movie movie3;
Movie movie4;

void setup() {
  
  size(1440, 960);
       movie1 =  new Movie(this, "nofilter.mov");
       movie2 =   new Movie(this, "pixel.mov");
       movie3 =   new Movie(this, "contour.mov");
       movie4 =  new Movie(this,  "gray.mov");
       movie1.play();
       movie2.play();
       movie3.play();
       movie4.play();
}


void draw() {
  image(movie1, 0, 0);
  image(movie2, 720, 0);
  image(movie3, 0, 480);
  image(movie4, 720, 480);
  saveFrame("frame/ex2_####.jpeg");
  
}


void movieEvent(Movie m) {
  m.read();
}