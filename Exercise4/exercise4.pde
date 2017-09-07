//April 9, 2017
//Guthrie Alexander
//ARCH 5424, Exercise 4
//Many functions/lines taken from Earl Mark's processing code
import processing.serial.*;

//Sensor/Arduino variables
Serial myPort;    // The serial port
String inString;  // Input string from serial port
int lf = 10;      // ASCII linefeed
String[] photoSensorRead; //for text array for output for receiving light intensity value stream from arduino
float n, s;                 
String[] soundSensorRead; //for text array for output for receiving sound intensity value stream from arduino
float maxSound = 50.0;
float maxLight = 300.0;
int drawFrame;
int bgLength;
  
//owl variables
float deltaX, deltaY;
int numOwls = 14;
int[] owlColors; //owl colors
float[] owlSize; //owl sizes
PImage sun, moon, bed, bg0, bg1, bg2, bg3, bg4, bg5, bg6, bg7, bg8, bg9, tmp;
PGraphics pg;

void setup(){
  size(1280, 720);
  
  //load in images
  sun = loadImage("sun2.png");
  bed = loadImage("bed.png");
  moon = loadImage("moon.png");
  moon.filter(INVERT);
  bg0 = loadImage("deadmau5.jpg");
  bg1 = loadImage("tiedye.jpg");
  bg2 = loadImage("aandb.jpg");
  bg3 = loadImage("trance3.jpg");
  bg4 = loadImage("trance1.jpg");
  bg5 = loadImage("trance2.jpg");
  tmp = loadImage("trance1.jpg");
  
  //variables for background changing
  drawFrame = 0;
  bgLength = 50;
  
  
  //initialize owl color/size
  owlColors = new int[numOwls];
  owlSize = new float[numOwls];
  for(int o=0; o < numOwls; o++){
    owlColors[o] = int(random(0, 200));
    owlSize[o] = random(0.5, 2);
  }
  
  //amount owl moves
  deltaX = 0.5;
  deltaY = 15.5;
  
  myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil(lf);
}

/*

Draw function

*/

void draw(){
  /*
  Grab the Sensor Data from Arduino
  */
 
  //read photosensor value from serial port
  photoSensorRead = split(inString, '*'); //subdivide text string at " = "
  
  //parse text value of photosensor value
  if (null != photoSensorRead && photoSensorRead.length > 1) {
    String num = photoSensorRead[1];
    n = float(Integer.parseInt(num.trim()));
  }
  
  //read sound sensor value from serial port
  photoSensorRead = split(inString, '*'); //subdivide
  soundSensorRead = split(inString, '='); //subdivide text string at " = "
  
  //parse text value of sound sensor value
  if (null != soundSensorRead && soundSensorRead.length > 1) {
    String num = soundSensorRead[1];
    s = float(Integer.parseInt(num.trim()));
  }
  
  
  /*
  Map sensor data to range
  */
  int phase = 0;
  float sound = 0.0;
  phase =  int(map(n, 100.0, 200.0, 0, 5));
  phase = constrain(phase, 0, 5);
  sound = map(s, 0.0, 225.0, 1, maxSound);
  
  //Print troubleshooting
  println("s = "+s);
  println("phase = "+phase +"; sound = "+sound);
  
/*

Draw Background, beds and owls

*/
  drawBack(phase, sound);
  
  for(int o=0; o < numOwls;o++){
    
    //float x = (width / numOwls) + o * (width /float(numOwls));
    float x = (width / 10.0) + o * (width /float(numOwls));
    float y = height -150;
    bed(x, y-10, owlSize[o]);
    if(sound > 6.0){
      if(phase==0){
        x = x + ( random(-1, 1) * deltaX ) ;
        y = y + ( random(-1, 1) * deltaY * (sound / maxSound) * 4);
        s = s + (sound/maxSound *deltaX) * 5;
        owlColors[o] = int(random(0, 200));
      }
      else{
        x = x + ( random(-1, 1) * deltaX ) ;
        y = y + ( random(-1, 1) * deltaY * (sound / maxSound));
        //s = s + (sound/maxSound *deltaX);
      }
      
    }
    owl(x , y, owlColors[o], owlSize[o], phase, sound);
  }
  //save the frames
  saveFrame("frames/ex4Frame_######.jpg");
}

//Function to draw background
void drawBack(int phase, float sound){
  
  color ret = color(0 + phase * 51,0 + phase*51,51 - phase*51);
  background(ret);
  
  
  
  /*
  
  Adding in random background image  when it gets loud
  
  */
  /*
  int s = 0;
  if(phase == 0 && sound > 10){
    if(drawFrame==0){
      s = int(random(0, 6));
      drawFrame=frameCount;
      println("s = "+s);
      println("sound="+sound);
      println("frameCount = "+frameCount);
      println("drawFrame = "+drawFrame);
      switch(s){
        case 0: tmp = bg0;
        break;
        case 1: tmp = bg1;
        break;
        case 2: tmp = bg2;
        break;
        case 3: tmp = bg3;
        break;
        case 4: tmp = bg4;
        break;
        case 5: tmp = bg5;
        break;
      }
    }
    //draw the image either set before, or this frame
    image(tmp, 0, 0);
    //blur the image slightly, more gradually after time
    tmp.filter(BLUR, ((frameCount - drawFrame)/50) * 6);
  }
  if( (drawFrame + bgLength) < frameCount){
        drawFrame = 0;
      }  
      */
  /*
  Done adding random image...
  
  Now putting in Sun and Moon icons
  
  */
  
  //phase = 0 nighttime, phase = 5 daytime
    image(moon, width/2.0, 20 + phase*200, 200, 200);
    image(sun, width/4.0, 1000 - phase*200, 200, 200);
    
    
}

//function to draw bed
void bed(float x, float y, float s){
  image(bed, x, y, s * 100, s * 100);
}

//Function to draw an owl
//phase variable affects rotation/orientation, and eyes being open/closed
void owl(float x, float y, int g, float s, int phase, float sound) {
  //phase = 0, upright, awake; phase = 5, daytime, asleep
    pushMatrix();
      translate(x, y);
      rotate(radians(0 + phase*18));
      scale(s); // Set the size
      stroke(225-g, 235-g, g); // Set the color value
      strokeWeight(70);
      line(0, -35, 0, -65); // Body
      noStroke();
      fill(255);
      ellipse(-17.5, -65, 35 , 35); // Left eye dome
      ellipse(17.5, -65, 35, 35);  // Right eye dome
      arc(0, -65, 70, 70, 0, PI);  // Chin
      drawEyes(phase, sound);
      fill(51, 51, 30);
      quad(0, -58, 4, -51, 0, -44, -4, -51); // Beak
      strokeWeight(1);
    popMatrix();
}

void drawEyes(int phase, float sound){
  int eyeSize = 8;
  if(sound > 0.0 && phase==0){
       fill((sound / maxSound) * 55, (sound / maxSound) * 250, 0);
        eyeSize = 32;
      }
       else
         fill(51, 51, 30);
      
      ellipse(-14, -65, 8 + eyeSize * (sound / maxSound), (8 - (phase * 1.4)) + (sound / maxSound) * (8 - (phase * 1.6)) ); // Left eye
      ellipse(14, -65, 8 + eyeSize * (sound / maxSound),  (8 - (phase * 1.4)) + (sound / maxSound) * (8 - (phase * 1.6)) );  // Right eye
}

//process data stream from serial port behind the scenes ... this runs in background
void serialEvent(Serial p) {
  inString = p.readString();
}
  