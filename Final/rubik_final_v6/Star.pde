//https://www.openprocessing.org/sketch/8605

class Star{
  float x = random(-10000, 10000);
  float y= random(-6000, 6000);
  float z = random(10000);
  float r,g,b;
  float d = 5;


  Star(){

  }

  void update(){
    z+= 15;

    /*
    if(z>0 && z<200){
     b = map(z, 0,200,0,255);
     }
     if(z>=200 && z<400){
     b = map(z, 200,400,255,0);
     g = map(z, 200,400,0,255);
     }
     if(z>=400 && z<600){
     g = map(z, 400,600,255,0);
     r = map(z, 400,600,0,255);
     }
     */

    if(z>0 && z<200){
      r=0;
      b = 255;
      g=0;
    }
    if(z>=200 && z<400){
      r=0;
      g = 255;
      b=0;
    }
    if(z>=400 && z<600){
      r = 255;
      g=0;
      b=0;
    }


    if(z>10000) {
      z=0;
      x = random(-width, width);
      y = random(-height, height);
    }
  }

  void display(){
    //fill(r,g,b);
    fill(255);
    pushMatrix();
    translate(0,0,z-4000);
    ellipse(x, y, d,d);
    popMatrix();
  }

}