
//earl mark 4.25.17
//example of image mapped to box class part 2.
//rows and columns of videos + images with adjusted rotation values
//add rotation function to mediaBox class
//make 3D array of mediaBoxes


import peasy.*;
import processing.video.*;
import g4p_controls.*;
 import processing.sound.*;
 SoundFile beep;

Movie jLennon, ants1, nature1, orange1, yellow1, blue1, red1;
mediaBox mbox;
  PImage WHITE, ORANGE, GREEN, RED, BLUE, YELLOW, BIGX;
  Star[] stars;
PeasyCam cam;
PFont myFont;

rubik cube;

int move_counter;
String title = "SPACECUBE";

void setup() {
  size(1280,720,P3D);
  createGUI();
  cam = new PeasyCam(this, 1200);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(10000);
  //frameRate(30);
  
    WHITE = loadImage("data/white.jpg");
    ORANGE = loadImage("data/orange.jpg");
    GREEN = loadImage("data/green.jpg");
    RED = loadImage("data/red.jpg");
    BLUE = loadImage("data/blue.jpg");
    YELLOW = loadImage("data/yellow.jpg");
    BIGX = loadImage("data/bigx.jpg");
    ants1 = new Movie(this, "ants1.mov");
    nature1 = new Movie(this, "nature1.mov");
    orange1 = new Movie(this, "orange.mov");
    yellow1 = new Movie(this, "yellow.mov");
    blue1 = new Movie(this, "blue.mov");
     red1 = new Movie(this, "red.mov");
    ants1.loop();
    nature1.loop();
    orange1.loop();
    yellow1.loop();
    blue1.loop();
    red1.loop();
    ants1.volume(0);
    nature1.volume(0);
    orange1.volume(0);
    yellow1.volume(0);
    blue1.volume(0);
    red1.volume(0);
    move_counter = 0;
    
    //stars for background!
    
    stars = new Star[400];
    for(int i=0; i < stars.length; i++){
      stars[i] = new Star();
    }
    
    //mbox = new mediaBox(0, 0, 0, 100.0, 100.0, 100.0, WHITE, ORANGE, GREEN, RED, BLUE, YELLOW);
    //println("centroid = "+mbox.xcenter+","+mbox.ycenter+", "+mbox.zcenter);
    
    //title
    //String[] fontList = PFont.list();
    //println(fontList);
    myFont = createFont("ARCADECLASSIC.TTF", 400);
    textFont(myFont);
    fill(255, 102, 153);
    
    //Sound
     beep= new SoundFile(this, "beep.wav");
    
  cube = new rubik(100, ants1, nature1, orange1, yellow1, blue1, red1, beep);
  cube.display();
  
  
  
}

void draw(){
  //draw background
 background(0, 0, 0);
for(int i=0; i< stars.length; i++){
    stars[i].update();
    stars[i].display();
  }

//draw title
textFont(myFont, 400);
fill(255, 55, 55);
text(title, -800, -400, -300);

//draw counter
textFont(myFont, 100);
fill(255);
text("MOVES", 600, 100, -300);
text(move_counter, 800, 200, -300);

//draw cuble
 cube.display();
 move_counter = cube.counter;
 //println("Moves->"+move_counter);

//saving frame
//saveFrame("frames/spacecube-######.jpg");
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI(){

}

void movieEvent(Movie m) {
  m.read();
}