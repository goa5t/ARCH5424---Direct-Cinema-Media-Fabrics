
class rubik{
  mediaBox grid[][][];
  mediaBox boundary, boundary2;
  PVector cubePosition;
  char UP, FRONT, RIGHT, BACK, LEFT, DOWN, MIDDLE, STANDING, EQUATOR;
  PImage  BIGX;
  //PImage WHITE, GREEN, ORANGE, BLUE, RED, YELLOW;
  Movie WHITE, GREEN, ORANGE, YELLOW, RED, BLUE;
  int size, counter;
  float frontX, frontY, backX, backY;
  SoundFile beep;
  
  void play(){
    beep.play();
  }
  rubik (int sz, Movie ants1, Movie nature1, Movie orange, Movie yellow, Movie blue, Movie red, SoundFile b){
    counter = 0;
    //WHITE = loadImage("data/white.jpg");
    
    //GREEN = loadImage("data/green.jpg");
    //ORANGE = loadImage("data/orange.jpg");
    //YELLOW = loadImage("data/yellow.jpg");
    //BLUE = loadImage("data/blue.jpg");
    //RED = loadImage("data/red.jpg");
    WHITE = ants1;
    GREEN = nature1;
    ORANGE = orange;
    YELLOW = yellow;
    BLUE = blue;
    RED = red;
  
    BIGX = loadImage("data/bigx.jpg");
    
    //Sound effect
    beep = b;
    
    grid = new mediaBox [3][][];
    for (int i=0;i<3;i++) {
      grid[i] = new mediaBox[3][] ;
      for (int j=0;j<3;j++) {
        grid[i][j] = new mediaBox[3];
      }
    }
    
    // mediaBox(float xl, float yl, float zl, float xd, float yd, float zd, PImage i1, PImage i2, PImage i3
    //Initialize Cube faces
    
    //RED
    
     grid[0][0][0] = new mediaBox(float(0), float(0), float(0), sz, sz, sz, GREEN, BIGX, BIGX, WHITE, RED, BIGX);
     //grid[0][0][0].rotX(radians(-90));
     grid[0][0][1] = new mediaBox(float(0), float(0), float(100), sz, sz, sz, BIGX, BIGX, BIGX, WHITE, RED, BIGX);
     //grid[0][0][1].rotX(radians(-90));
     grid[0][0][2] = new mediaBox(float(0), float(0), float(200), sz, sz, sz, BIGX, BLUE, BIGX, WHITE, RED, BIGX);
     //grid[0][0][2].rotX(radians(-90));
     
    
     grid[0][1][0] = new mediaBox(float(0), float(100), float(0), sz, sz, sz, GREEN, BIGX, BIGX, BIGX, RED, BIGX);
     //grid[0][1][0].rotX(radians(-90));
     grid[0][1][1] = new mediaBox(float(0), float(100), float(100), sz, sz, sz, BIGX, BIGX, BIGX, BIGX, RED, BIGX);
     //grid[0][1][1].rotX(radians(-90));
     grid[0][1][2] = new mediaBox(float(0), float(100), float(200), sz, sz, sz, BIGX, BLUE, BIGX, BIGX, RED, BIGX);
     //grid[0][1][2].rotX(radians(-90));
    
     grid[0][2][0] = new mediaBox(float(0), float(200), float(0), sz, sz, sz, GREEN,BIGX, YELLOW, BIGX, RED, BIGX);
     //grid[0][2][0].rotX(radians(-90));
     grid[0][2][1] = new mediaBox(float(0), float(200), float(100), sz, sz, sz, BIGX, BIGX, YELLOW, BIGX, RED, BIGX);
     //grid[0][2][1].rotX(radians(-90));
     grid[0][2][2] = new mediaBox(float(0), float(200), float(200), sz, sz, sz, BIGX, BLUE, YELLOW, BIGX, RED, BIGX);
     //grid[0][2][2].rotX(radians(-90));

     //MIDDLE LAYER
     grid[1][0][0] = new mediaBox(float(100), float(0), float(0), sz, sz, sz, GREEN, BIGX, BIGX, WHITE, BIGX, BIGX);
     //grid[1][0][0].rotX(radians(-90));
     grid[1][0][1] = new mediaBox(float(100), float(0), float(100), sz, sz, sz, BIGX, BIGX, BIGX, WHITE, BIGX, BIGX);
     //grid[1][0][1].rotX(radians(-90));
     grid[1][0][2] = new mediaBox(float(100), float(0), float(200), sz, sz, sz, BIGX, BLUE, BIGX, WHITE, BIGX, BIGX);
     //grid[1][0][2].rotX(radians(-90));
    
    
     grid[1][1][0] = new mediaBox(float(100), float(100), float(0), sz, sz, sz, GREEN, BIGX, BIGX, BIGX, BIGX, BIGX);
     //grid[1][1][0].rotX(radians(-90));
     grid[1][1][1] = new mediaBox(float(100), float(100), float(100), sz, sz, sz, BIGX, BIGX, BIGX, BIGX, BIGX, BIGX);//Shouldn't be displayed
     grid[1][1][2] = new mediaBox(float(100), float(100), float(200), sz, sz, sz, BIGX, BLUE, BIGX, BIGX, BIGX, BIGX);
     //grid[1][1][2].rotX(radians(-90));
    
    
     grid[1][2][0] = new mediaBox(float(100), float(200), float(0), sz, sz, sz, GREEN, BIGX, YELLOW, BIGX, BIGX, BIGX);
     //grid[1][2][0].rotX(radians(-90));
     grid[1][2][1] = new mediaBox(float(100), float(200), float(100), sz, sz, sz, BIGX, BIGX, YELLOW, BIGX, BIGX, BIGX);
     //grid[1][2][1].rotX(radians(-90));
     grid[1][2][2] = new mediaBox(float(100), float(200), float(200), sz, sz, sz, BIGX, BLUE, YELLOW, BIGX, BIGX, BIGX);
     //grid[1][2][2].rotX(radians(-90));
     
     
     //ORANGE LAYER
     grid[2][0][0] = new mediaBox(float(200), float(0), float(0), sz, sz, sz, GREEN, BIGX, BIGX, WHITE, BIGX, ORANGE);
     //grid[2][0][0].rotX(radians(-90));

     grid[2][0][1] = new mediaBox(float(200), float(0), float(100), sz, sz, sz, BIGX, BIGX, BIGX, WHITE, BIGX, ORANGE);
     //grid[2][0][1].rotX(radians(-90));

     grid[2][0][2] = new mediaBox(float(200), float(0), float(200), sz, sz, sz, BIGX, BLUE, BIGX, WHITE, BIGX, ORANGE);
     //grid[2][0][2].rotX(radians(-90));

    
    
     grid[2][1][0] = new mediaBox(float(200), float(100), float(0), sz, sz, sz, GREEN, BIGX, BIGX, BIGX, BIGX, ORANGE);
     //grid[2][1][0].rotX(radians(-90));
     grid[2][1][1] = new mediaBox(float(200), float(100), float(100), sz, sz, sz, BIGX, BIGX, BIGX, BIGX, BIGX, ORANGE);
     //grid[2][1][1].rotX(radians(-90));
     grid[2][1][2] = new mediaBox(float(200), float(100 ), float(200), sz, sz, sz, BIGX, BLUE, BIGX, BIGX, BIGX, ORANGE);
     //grid[2][1][2].rotX(radians(-90));
     
     grid[2][2][0] = new mediaBox(float(200), float(200), float(0), sz, sz, sz, GREEN, BIGX, YELLOW, BIGX, BIGX, ORANGE);
     //grid[2][2][0].rotX(radians(-90));
     grid[2][2][1] = new mediaBox(float(200), float(200), float(100), sz, sz, sz, BIGX, BIGX , YELLOW, BIGX, BIGX, ORANGE);
     //grid[2][2][1].rotX(radians(-90));
     grid[2][2][2] = new mediaBox(float(200), float(200), float(200), sz, sz, sz, BIGX, BLUE, YELLOW, BIGX, BIGX, ORANGE); // 
     //grid[2][2][2].rotX(radians(-90));
      

    UP = 'U';
    EQUATOR = 'E';
    DOWN = 'D';
    FRONT = 'F';
    STANDING = 'S';
    BACK = 'B';
    RIGHT = 'R';
    MIDDLE = 'M';
    LEFT = 'L';
    frontY = -45.0;
    frontX = -23.26;
    backX = -frontX;
    backY = frontY+180;
 
    this.size = sz;
   // boundary = new m(0, 3*size);
   // boundary2 = new cube(0, 3*size);
   
   
  }
  //MOVES
  
  //Front = RED face
  //(0,0,0), (0,0,1), (0,0,2),  (0,1,0),(0,1,1),(0,1,2), (0,2,0), (0,2,1), (0,2,2)
   void front(){
     //println("front!");
     counter ++;
       
       //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[0][0][2].x, grid[0][0][2].y, grid[0][0][2].z, 
    grid[0][0][0].sx, grid[0][0][0].sy, grid[0][0][0].sz,
    grid[0][0][0].img1, grid[0][0][0].img2, grid[0][0][0].img3,
    grid[0][0][0].img4, grid[0][0][0].img5, grid[0][0][0].img6);

    
    grid[0][0][0].img1 = grid[0][2][0].img3;
    grid[0][0][0].img2 = BIGX;
    grid[0][0][0].img3 = BIGX;
    grid[0][0][0].img4 = grid[0][2][0].img1;
    grid[0][0][0].img5 = grid[0][2][0].img5;
    grid[0][0][0].img6 = BIGX;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[0][2][0].img1 = grid[0][2][2].img3;
    grid[0][2][0].img2 = BIGX;
    grid[0][2][0].img3 = grid[0][2][2].img2;
    grid[0][2][0].img4 = BIGX;
    grid[0][2][0].img5 = grid[0][2][2].img5;
    grid[0][2][0].img6 = BIGX;
    
    grid[0][2][2].img1 = BIGX;
    grid[0][2][2].img2 = grid[0][0][2].img4;
    grid[0][2][2].img3 = grid[0][0][2].img2;
    grid[0][2][2].img4 = BIGX;
    grid[0][2][2].img5 = grid[0][0][2].img5;
    grid[0][2][2].img6 = BIGX;

    grid[0][0][2].img1 = BIGX;
    grid[0][0][2].img2 = tmp.img4;
    grid[0][0][2].img3 = BIGX;
    grid[0][0][2].img4 = tmp.img1;
    grid[0][0][2].img5 = tmp.img5;
    grid[0][0][2].img6 = BIGX;
   
     //migrate edge pieces
     tmp = new mediaBox(grid[0][1][2].x, grid[0][1][2].y, grid[0][1][2].z, 
    grid[0][0][1].sx, grid[0][0][1].sy, grid[0][0][1].sz,
    grid[0][0][1].img1, grid[0][0][1].img2, grid[0][0][1].img3,
    grid[0][0][1].img4, grid[0][0][1].img5, grid[0][0][1].img6);

    grid[0][0][1].img1 = BIGX;
    grid[0][0][1].img2 = BIGX;
    grid[0][0][1].img3 = BIGX;
    grid[0][0][1].img4 = grid[0][1][0].img1;
    grid[0][0][1].img5 = grid[0][1][0].img5;
    grid[0][0][1].img6 = BIGX;
    

    grid[0][1][0].img1 = grid[0][2][1].img3;
    grid[0][1][0].img2 = BIGX;
    grid[0][1][0].img3 = BIGX;
    grid[0][1][0].img4 = BIGX;
    grid[0][1][0].img5 = grid[0][2][1].img5;
    grid[0][1][0].img6 = BIGX;

    grid[0][2][1].img1 = BIGX;
    grid[0][2][1].img2 = BIGX;
    grid[0][2][1].img3 = grid[0][1][2].img2;
    grid[0][2][1].img4 = BIGX;
    grid[0][2][1].img5 = grid[0][1][2].img5;
    grid[0][2][1].img6 = BIGX;

    
    grid[0][1][2].img1 = BIGX;
    grid[0][1][2].img2 = tmp.img4;
    grid[0][1][2].img3 = BIGX;
    grid[0][1][2].img4 = BIGX;
    grid[0][1][2].img5 = tmp.img5;
    grid[0][1][2].img6 = BIGX;

   }
   
   
   void front_prime(){
     //println("front prime!");
     counter ++;
     mediaBox tmp = new mediaBox(grid[0][2][0].x, grid[0][2][0].y, grid[0][2][0].z, 
    grid[0][0][0].sx, grid[0][0][0].sy, grid[0][0][0].sz,
    grid[0][0][0].img1, grid[0][0][0].img2, grid[0][0][0].img3,
    grid[0][0][0].img4, grid[0][0][0].img5, grid[0][0][0].img6);

    
    grid[0][0][0].img1 = grid[0][0][2].img4;
    grid[0][0][0].img2 = BIGX;
    grid[0][0][0].img3 = BIGX;
    grid[0][0][0].img4 = grid[0][0][2].img2;
    grid[0][0][0].img5 = grid[0][0][2].img5;
    grid[0][0][0].img6 = BIGX;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[0][0][2].img1 = BIGX;
    grid[0][0][2].img2 = grid[0][2][2].img3;
    grid[0][0][2].img3 = BIGX;
    grid[0][0][2].img4 = grid[0][2][2].img2;;
    grid[0][0][2].img5 = grid[0][2][2].img5;
    grid[0][0][2].img6 = BIGX;
    
    grid[0][2][2].img1 = BIGX;
    grid[0][2][2].img2 = grid[0][2][0].img3;
    grid[0][2][2].img3 = grid[0][2][0].img1;
    grid[0][2][2].img4 = BIGX;
    grid[0][2][2].img5 = grid[0][2][0].img5;
    grid[0][2][2].img6 = BIGX;

    grid[0][2][0].img1 = tmp.img4;
    grid[0][2][0].img2 = BIGX;
    grid[0][2][0].img3 = tmp.img1;
    grid[0][2][0].img4 = BIGX;
    grid[0][2][0].img5 = tmp.img5;
    grid[0][2][0].img6 = BIGX;
   
     //migrate edge pieces
     tmp = new mediaBox(grid[0][2][1].x, grid[0][2][1].y, grid[0][2][1].z, 
    grid[0][0][1].sx, grid[0][0][1].sy, grid[0][0][1].sz,
    grid[0][0][1].img1, grid[0][0][1].img2, grid[0][0][1].img3,
    grid[0][0][1].img4, grid[0][0][1].img5, grid[0][0][1].img6);

    grid[0][0][1].img1 = BIGX;
    grid[0][0][1].img2 = BIGX;
    grid[0][0][1].img3 = BIGX;
    grid[0][0][1].img4 = grid[0][1][2].img2;
    grid[0][0][1].img5 = grid[0][1][2].img5;
    grid[0][0][1].img6 = BIGX;
    

    grid[0][1][2].img1 = BIGX;
    grid[0][1][2].img2 = grid[0][2][1].img3;
    grid[0][1][2].img3 = BIGX;
    grid[0][1][2].img4 = BIGX;
    grid[0][1][2].img5 = grid[0][2][1].img5;
    grid[0][1][2].img6 = BIGX;

    grid[0][2][1].img1 = BIGX;
    grid[0][2][1].img2 = BIGX;
    grid[0][2][1].img3 = grid[0][1][0].img1;
    grid[0][2][1].img4 = BIGX;
    grid[0][2][1].img5 = grid[0][1][0].img5;
    grid[0][2][1].img6 = BIGX;

    
    grid[0][1][0].img1 = tmp.img4;
    grid[0][1][0].img2 = BIGX;
    grid[0][1][0].img3 = BIGX;
    grid[0][1][0].img4 = BIGX;
    grid[0][1][0].img5 = tmp.img5;
    grid[0][1][0].img6 = BIGX;

   }
   
   void back(){
     //println("back!");
     counter ++;
     int s = 2;
     //corner pieces
     
     mediaBox tmp = new mediaBox(grid[s][2][0].x, grid[s][2][0].y, grid[s][2][0].z, 
    grid[s][0][0].sx, grid[s][0][0].sy, grid[s][0][0].sz,
    grid[s][0][0].img1, grid[s][0][0].img2, grid[s][0][0].img3,
    grid[s][0][0].img4, grid[s][0][0].img5, grid[s][0][0].img6);

    
    grid[s][0][0].img1 = grid[s][0][2].img4;
    grid[s][0][0].img2 = BIGX;
    grid[s][0][0].img3 = BIGX;
    grid[s][0][0].img4 = grid[s][0][2].img2;
    grid[s][0][0].img5 = BIGX;
    grid[s][0][0].img6 = grid[s][0][2].img6;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[s][0][2].img1 = BIGX;
    grid[s][0][2].img2 = grid[s][2][2].img3;
    grid[s][0][2].img3 = BIGX;
    grid[s][0][2].img4 = grid[s][2][2].img2;;
    grid[s][0][2].img5 = BIGX;
    grid[s][0][2].img6 = grid[s][2][2].img6;
    
    grid[s][2][2].img1 = BIGX;
    grid[s][2][2].img2 = grid[s][2][0].img3;
    grid[s][2][2].img3 = grid[s][2][0].img1;
    grid[s][2][2].img4 = BIGX;
    grid[s][2][2].img5 = BIGX;
    grid[s][2][2].img6 = grid[s][2][0].img6;

    grid[s][2][0].img1 = tmp.img4;
    grid[s][2][0].img2 = BIGX;
    grid[s][2][0].img3 = tmp.img1;
    grid[s][2][0].img4 = BIGX;
    grid[s][2][0].img5 = BIGX;
    grid[s][2][0].img6 = tmp.img6;
   
     //migrate edge pieces
     tmp = new mediaBox(grid[s][2][1].x, grid[s][2][1].y, grid[s][2][1].z, 
    grid[s][0][1].sx, grid[s][0][1].sy, grid[s][0][1].sz,
    grid[s][0][1].img1, grid[s][0][1].img2, grid[s][0][1].img3,
    grid[s][0][1].img4, grid[s][0][1].img5, grid[s][0][1].img6);

    grid[s][0][1].img1 = BIGX;
    grid[s][0][1].img2 = BIGX;
    grid[s][0][1].img3 = BIGX;
    grid[s][0][1].img4 = grid[s][1][2].img2;
    grid[s][0][1].img5 = grid[s][1][2].img5;
    grid[s][0][1].img6 = grid[s][1][2].img6;
    

    grid[s][1][2].img1 = BIGX;
    grid[s][1][2].img2 = grid[s][2][1].img3;
    grid[s][1][2].img3 = BIGX;
    grid[s][1][2].img4 = BIGX;
    grid[s][1][2].img5 = grid[s][2][1].img5;
    grid[s][1][2].img6 = grid[s][2][1].img6;

    grid[s][2][1].img1 = BIGX;
    grid[s][2][1].img2 = BIGX;
    grid[s][2][1].img3 = grid[s][1][0].img1;
    grid[s][2][1].img4 = BIGX;
    grid[s][2][1].img5 = grid[s][1][0].img5;
    grid[s][2][1].img6 = grid[s][1][0].img6;

    
    grid[s][1][0].img1 = tmp.img4;
    grid[s][1][0].img2 = BIGX;
    grid[s][1][0].img3 = BIGX;
    grid[s][1][0].img4 = BIGX;
    grid[s][1][0].img5 = tmp.img5;
    grid[s][1][0].img6 = tmp.img6;

   }
   
   void back_prime(){
     //println("back prime!");
     counter ++;
     int s=2;
     
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[s][0][2].x, grid[s][0][2].y, grid[s][0][2].z, 
    grid[s][0][0].sx, grid[s][0][0].sy, grid[s][0][0].sz,
    grid[s][0][0].img1, grid[s][0][0].img2, grid[s][0][0].img3,
    grid[s][0][0].img4, grid[s][0][0].img5, grid[s][0][0].img6);

    
    grid[s][0][0].img1 = grid[s][2][0].img3;
    grid[s][0][0].img2 = BIGX;
    grid[s][0][0].img3 = BIGX;
    grid[s][0][0].img4 = grid[s][2][0].img1;
    grid[s][0][0].img5 = BIGX;
    grid[s][0][0].img6 = grid[s][2][0].img6;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[s][2][0].img1 = grid[s][2][2].img3;
    grid[s][2][0].img2 = BIGX;
    grid[s][2][0].img3 = grid[s][2][2].img2;
    grid[s][2][0].img4 = BIGX;
    grid[s][2][0].img5 = BIGX;
    grid[s][2][0].img6 = grid[s][2][2].img6;
    
    grid[s][2][2].img1 = BIGX;
    grid[s][2][2].img2 = grid[s][0][2].img4;
    grid[s][2][2].img3 = grid[s][0][2].img2;
    grid[s][2][2].img4 = BIGX;
    grid[s][2][2].img5 = BIGX;
    grid[s][2][2].img6 = grid[s][0][2].img6;

    grid[s][0][2].img1 = BIGX;
    grid[s][0][2].img2 = tmp.img4;
    grid[s][0][2].img3 = BIGX;
    grid[s][0][2].img4 = tmp.img1;
    grid[s][0][2].img5 = BIGX;
    grid[s][0][2].img6 = tmp.img6;
   
     //migrate edge pieces
     tmp = new mediaBox(grid[s][1][2].x, grid[s][1][2].y, grid[s][1][2].z, 
    grid[s][0][1].sx, grid[s][0][1].sy, grid[s][0][1].sz,
    grid[s][0][1].img1, grid[s][0][1].img2, grid[s][0][1].img3,
    grid[s][0][1].img4, grid[s][0][1].img5, grid[s][0][1].img6);

    grid[s][0][1].img1 = BIGX;
    grid[s][0][1].img2 = BIGX;
    grid[s][0][1].img3 = BIGX;
    grid[s][0][1].img4 = grid[s][1][0].img1;
    grid[s][0][1].img5 = BIGX;
    grid[s][0][1].img6 = grid[s][1][0].img6;
    

    grid[s][1][0].img1 = grid[s][2][1].img3;
    grid[s][1][0].img2 = BIGX;
    grid[s][1][0].img3 = BIGX;
    grid[s][1][0].img4 = BIGX;
    grid[s][1][0].img5 = BIGX;
    grid[s][1][0].img6 = grid[s][2][1].img6;

    grid[s][2][1].img1 = BIGX;
    grid[s][2][1].img2 = BIGX;
    grid[s][2][1].img3 = grid[s][1][2].img2;
    grid[s][2][1].img4 = BIGX;
    grid[s][2][1].img5 = BIGX;
    grid[s][2][1].img6 = grid[s][1][2].img6;

    
    grid[s][1][2].img1 = BIGX;
    grid[s][1][2].img2 = tmp.img4;
    grid[s][1][2].img3 = BIGX;
    grid[s][1][2].img4 = BIGX;
    grid[s][1][2].img5 = BIGX;
    grid[s][1][2].img6 = tmp.img6;

   }
   
   void left(){
     //println("left!");
     counter ++;
     int a=0;
     
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[0][2][a].x, grid[0][2][a].y, grid[0][2][a].z, 
    grid[0][0][a].sx, grid[0][0][a].sy, grid[0][0][a].sz,
    grid[0][0][a].img1, grid[0][0][a].img2, grid[0][0][a].img3,
    grid[0][0][a].img4, grid[0][0][a].img5, grid[0][0][a].img6);

    
    grid[0][0][a].img1 = grid[2][0][a].img1;
    grid[0][0][a].img2 = BIGX;
    grid[0][0][a].img3 = BIGX;
    grid[0][0][a].img4 = grid[2][0][a].img6;
    grid[0][0][a].img5 = grid[2][0][a].img4;
    grid[0][0][a].img6 = BIGX;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[2][0][a].img1 = grid[2][2][a].img1;
    grid[2][0][a].img2 = BIGX;
    grid[2][0][a].img3 = BIGX;
    grid[2][0][a].img4 = grid[2][2][a].img6;
    grid[2][0][a].img5 = BIGX;
    grid[2][0][a].img6 = grid[2][2][a].img3;
    
    grid[2][2][a].img1 = grid[0][2][a].img1;
    grid[2][2][a].img2 = BIGX;
    grid[2][2][a].img3 = grid[0][2][a].img5;
    grid[2][2][a].img4 = BIGX;
    grid[2][2][a].img5 = BIGX;
    grid[2][2][a].img6 = grid[0][2][a].img3;

    grid[0][2][a].img1 = tmp.img1;
    grid[0][2][a].img2 = BIGX;
    grid[0][2][a].img3 = tmp.img5;
    grid[0][2][a].img4 = BIGX;
    grid[0][2][a].img5 = tmp.img4;
    grid[0][2][a].img6 = BIGX;

   
     //migrate edge pieces
     tmp = new mediaBox(grid[0][1][a].x, grid[0][1][a].y, grid[0][1][a].z, 
    grid[1][0][a].sx, grid[1][0][a].sy, grid[1][0][a].sz,
    grid[1][0][a].img1, grid[1][0][a].img2, grid[1][0][a].img3,
    grid[1][0][a].img4, grid[1][0][a].img5, grid[1][0][a].img6);


    grid[1][0][a].img1 = grid[2][1][a].img1;
    grid[1][0][a].img2 = BIGX;
    grid[1][0][a].img3 = BIGX;
    grid[1][0][a].img4 = grid[2][1][a].img6;
    grid[1][0][a].img5 = BIGX;
    grid[1][0][a].img6 = BIGX;

    
    grid[2][1][a].img1 = grid[1][2][a].img1;
    grid[2][1][a].img2 = BIGX;
    grid[2][1][a].img3 = BIGX;
    grid[2][1][a].img4 = BIGX;
    grid[2][1][a].img5 = BIGX;
    grid[2][1][a].img6 = grid[1][2][a].img3;

    
    grid[1][2][a].img1 = grid[0][1][a].img1;
    grid[1][2][a].img2 = BIGX;
    grid[1][2][a].img3 = grid[0][1][a].img5;
    grid[1][2][a].img4 = BIGX;
    grid[1][2][a].img5 = BIGX;
    grid[1][2][a].img6 = BIGX;

    
    grid[0][1][a].img1 = tmp.img1;
    grid[0][1][a].img2 = BIGX;
    grid[0][1][a].img3 = BIGX;
    grid[0][1][a].img4 = BIGX;
    grid[0][1][a].img5 = tmp.img4;
    grid[0][1][a].img6 = BIGX;

   }
   
   void left_prime(){
     //println("left prime!");
     counter ++;
     int a=0;
     
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[2][0][a].x, grid[2][0][a].y, grid[2][0][a].z, 
    grid[0][0][a].sx, grid[0][0][a].sy, grid[0][0][a].sz,
    grid[0][0][a].img1, grid[0][0][a].img2, grid[0][0][a].img3,
    grid[0][0][a].img4, grid[0][0][a].img5, grid[0][0][a].img6);

    
    grid[0][0][a].img1 = grid[0][2][a].img1;
    grid[0][0][a].img2 = BIGX;
    grid[0][0][a].img3 = BIGX;
    grid[0][0][a].img4 = grid[0][2][a].img5;
    grid[0][0][a].img5 = grid[0][2][a].img3;
    grid[0][0][a].img6 = BIGX;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[0][2][a].img1 = grid[2][2][a].img1;
    grid[0][2][a].img2 = BIGX;
    grid[0][2][a].img3 = grid[2][2][a].img6;
    grid[0][2][a].img4 = BIGX;
    grid[0][2][a].img5 = grid[2][2][a].img3;
    grid[0][2][a].img6 = BIGX;
    
    grid[2][2][a].img1 = grid[2][0][a].img1;
    grid[2][2][a].img2 = BIGX;
    grid[2][2][a].img3 = grid[2][0][a].img6;
    grid[2][2][a].img4 = BIGX;
    grid[2][2][a].img5 = BIGX;
    grid[2][2][a].img6 = grid[2][0][a].img4;

    grid[2][0][a].img1 = tmp.img1;
    grid[2][0][a].img2 = BIGX;
    grid[2][0][a].img3 = BIGX;
    grid[2][0][a].img4 = tmp.img5;
    grid[2][0][a].img5 = BIGX;
    grid[2][0][a].img6 = tmp.img4;

   
     //migrate edge pieces
     tmp = new mediaBox(grid[2][1][a].x, grid[2][1][a].y, grid[2][1][a].z, 
    grid[1][0][a].sx, grid[1][0][a].sy, grid[1][0][a].sz,
    grid[1][0][a].img1, grid[1][0][a].img2, grid[1][0][a].img3,
    grid[1][0][a].img4, grid[1][0][a].img5, grid[1][0][a].img6);


    grid[1][0][a].img1 = grid[0][1][a].img1;
    grid[1][0][a].img2 = BIGX;
    grid[1][0][a].img3 = BIGX;
    grid[1][0][a].img4 = grid[0][1][a].img5;
    grid[1][0][a].img5 = BIGX;
    grid[1][0][a].img6 = BIGX;

    
    grid[0][1][a].img1 = grid[1][2][a].img1;
    grid[0][1][a].img2 = BIGX;
    grid[0][1][a].img3 = BIGX;
    grid[0][1][a].img4 = BIGX;
    grid[0][1][a].img5 = grid[1][2][a].img3;
    grid[0][1][a].img6 = BIGX;

    
    grid[1][2][a].img1 = grid[2][1][a].img1;
    grid[1][2][a].img2 = BIGX;
    grid[1][2][a].img3 = grid[2][1][a].img6;
    grid[1][2][a].img4 = BIGX;
    grid[1][2][a].img5 = BIGX;
    grid[1][2][a].img6 = BIGX;

    
    grid[2][1][a].img1 = tmp.img1;
    grid[2][1][a].img2 = BIGX;
    grid[2][1][a].img3 = BIGX;
    grid[2][1][a].img4 = BIGX;
    grid[2][1][a].img5 = BIGX;
    grid[2][1][a].img6 = tmp.img4;

   }
   
   void right(){
     //println("right!");
     counter ++;
     int a=2;
     
     //migrate corner pieces
       
    //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[2][0][a].x, grid[2][0][a].y, grid[2][0][a].z, 
    grid[0][0][a].sx, grid[0][0][a].sy, grid[0][0][a].sz,
    grid[0][0][a].img1, grid[0][0][a].img2, grid[0][0][a].img3,
    grid[0][0][a].img4, grid[0][0][a].img5, grid[0][0][a].img6);

    
    grid[0][0][a].img1 = BIGX;
    grid[0][0][a].img2 = grid[0][2][a].img2;
    grid[0][0][a].img3 = BIGX;
    grid[0][0][a].img4 = grid[0][2][a].img5;
    grid[0][0][a].img5 = grid[0][2][a].img3;
    grid[0][0][a].img6 = BIGX;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[0][2][a].img1 = BIGX;
    grid[0][2][a].img2 = grid[2][2][a].img2;
    grid[0][2][a].img3 = grid[2][2][a].img6;
    grid[0][2][a].img4 = BIGX;
    grid[0][2][a].img5 = grid[2][2][a].img3;
    grid[0][2][a].img6 = BIGX;
    
    grid[2][2][a].img1 = BIGX;
    grid[2][2][a].img2 = grid[2][0][a].img2;
    grid[2][2][a].img3 = grid[2][0][a].img6;
    grid[2][2][a].img4 = BIGX;
    grid[2][2][a].img5 = BIGX;
    grid[2][2][a].img6 = grid[2][0][a].img4;

    grid[2][0][a].img1 = BIGX;
    grid[2][0][a].img2 = tmp.img2;
    grid[2][0][a].img3 = BIGX;
    grid[2][0][a].img4 = tmp.img5;
    grid[2][0][a].img5 = BIGX;
    grid[2][0][a].img6 = tmp.img4;

   
     //migrate edge pieces
     tmp = new mediaBox(grid[2][1][a].x, grid[2][1][a].y, grid[2][1][a].z, 
    grid[1][0][a].sx, grid[1][0][a].sy, grid[1][0][a].sz,
    grid[1][0][a].img1, grid[1][0][a].img2, grid[1][0][a].img3,
    grid[1][0][a].img4, grid[1][0][a].img5, grid[1][0][a].img6);


    grid[1][0][a].img1 = BIGX;
    grid[1][0][a].img2 = grid[0][1][a].img2;
    grid[1][0][a].img3 = BIGX;
    grid[1][0][a].img4 = grid[0][1][a].img5;
    grid[1][0][a].img5 = BIGX;
    grid[1][0][a].img6 = BIGX;

    
    grid[0][1][a].img1 = BIGX;
    grid[0][1][a].img2 = grid[1][2][a].img2;
    grid[0][1][a].img3 = BIGX;
    grid[0][1][a].img4 = BIGX;
    grid[0][1][a].img5 = grid[1][2][a].img3;
    grid[0][1][a].img6 = BIGX;

    
    grid[1][2][a].img1 = BIGX;
    grid[1][2][a].img2 = grid[2][1][a].img2;
    grid[1][2][a].img3 = grid[2][1][a].img6;
    grid[1][2][a].img4 = BIGX;
    grid[1][2][a].img5 = BIGX;
    grid[1][2][a].img6 = BIGX;

    
    grid[2][1][a].img1 = BIGX;
    grid[2][1][a].img2 = tmp.img2;
    grid[2][1][a].img3 = BIGX;
    grid[2][1][a].img4 = BIGX;
    grid[2][1][a].img5 = BIGX;
    grid[2][1][a].img6 = tmp.img4;

   }
   
   void right_prime(){
     //println("right prime!");
     counter ++;
     int a=2;
     
     mediaBox tmp = new mediaBox(grid[0][2][a].x, grid[0][2][a].y, grid[0][2][a].z, 
    grid[0][0][a].sx, grid[0][0][a].sy, grid[0][0][a].sz,
    grid[0][0][a].img1, grid[0][0][a].img2, grid[0][0][a].img3,
    grid[0][0][a].img4, grid[0][0][a].img5, grid[0][0][a].img6);

    
    grid[0][0][a].img1 = BIGX;
    grid[0][0][a].img2 = grid[2][0][a].img2;
    grid[0][0][a].img3 = BIGX;
    grid[0][0][a].img4 = grid[2][0][a].img6;
    grid[0][0][a].img5 = grid[2][0][a].img4;
    grid[0][0][a].img6 = BIGX;

    //grid[0][2][0].setImages(grid[0][2][2]);
    grid[2][0][a].img1 = BIGX;
    grid[2][0][a].img2 = grid[2][2][a].img2;
    grid[2][0][a].img3 = BIGX;
    grid[2][0][a].img4 = grid[2][2][a].img6;
    grid[2][0][a].img5 = BIGX;
    grid[2][0][a].img6 = grid[2][2][a].img3;
    
    grid[2][2][a].img1 = BIGX;
    grid[2][2][a].img2 = grid[0][2][a].img2;
    grid[2][2][a].img3 = grid[0][2][a].img5;
    grid[2][2][a].img4 = BIGX;
    grid[2][2][a].img5 = BIGX;
    grid[2][2][a].img6 = grid[0][2][a].img3;

    grid[0][2][a].img1 = BIGX;
    grid[0][2][a].img2 = tmp.img2;
    grid[0][2][a].img3 = tmp.img5;
    grid[0][2][a].img4 = BIGX;
    grid[0][2][a].img5 = tmp.img4;
    grid[0][2][a].img6 = BIGX;

   
     //migrate edge pieces
     tmp = new mediaBox(grid[0][1][a].x, grid[0][1][a].y, grid[0][1][a].z, 
    grid[1][0][a].sx, grid[1][0][a].sy, grid[1][0][a].sz,
    grid[1][0][a].img1, grid[1][0][a].img2, grid[1][0][a].img3,
    grid[1][0][a].img4, grid[1][0][a].img5, grid[1][0][a].img6);


    grid[1][0][a].img1 = BIGX;
    grid[1][0][a].img2 = grid[2][1][a].img2;
    grid[1][0][a].img3 = BIGX;
    grid[1][0][a].img4 = grid[2][1][a].img6;
    grid[1][0][a].img5 = BIGX;
    grid[1][0][a].img6 = BIGX;

    
    grid[2][1][a].img1 = BIGX;
    grid[2][1][a].img2 = grid[1][2][a].img2;
    grid[2][1][a].img3 = BIGX;
    grid[2][1][a].img4 = BIGX;
    grid[2][1][a].img5 = BIGX;
    grid[2][1][a].img6 = grid[1][2][a].img3;

    
    grid[1][2][a].img1 = BIGX;
    grid[1][2][a].img2 = grid[0][1][a].img2;
    grid[1][2][a].img3 = grid[0][1][a].img5;
    grid[1][2][a].img4 = BIGX;
    grid[1][2][a].img5 = BIGX;
    grid[1][2][a].img6 = BIGX;

    
    grid[0][1][a].img1 = BIGX;
    grid[0][1][a].img2 = tmp.img2;
    grid[0][1][a].img3 = BIGX;
    grid[0][1][a].img4 = BIGX;
    grid[0][1][a].img5 = tmp.img4;
    grid[0][1][a].img6 = BIGX;
   }
   
   void up(){
     //println("up!");
     counter ++;
     int t=0;
     
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[2][t][0].x, grid[2][t][0].y, grid[2][t][0].z, 
    grid[0][t][0].sx, grid[0][t][0].sy, grid[0][t][0].sz,
    grid[0][t][0].img1, grid[0][t][0].img2, grid[0][t][0].img3,
    grid[0][t][0].img4, grid[0][t][0].img5, grid[0][t][0].img6);

    
    grid[0][t][0].img1 = grid[0][t][2].img5;
    grid[0][t][0].img2 = BIGX;
    grid[0][t][0].img3 = BIGX;
    grid[0][t][0].img4 = grid[0][t][2].img4;
    grid[0][t][0].img5 = grid[0][t][2].img2;
    grid[0][t][0].img6 = BIGX;
  

    grid[0][t][2].img1 = BIGX;
    grid[0][t][2].img2 = grid[2][t][2].img6;
    grid[0][t][2].img3 = BIGX;
    grid[0][t][2].img4 = grid[2][t][2].img4;
    grid[0][t][2].img5 = grid[2][t][2].img2;
    grid[0][t][2].img6 = BIGX;
    
    
    grid[2][t][2].img1 = BIGX;
    grid[2][t][2].img2 = grid[2][t][0].img6;
    grid[2][t][2].img3 = BIGX;
    grid[2][t][2].img4 = grid[2][t][0].img4;
    grid[2][t][2].img5 = BIGX;
    grid[2][t][2].img6 = grid[2][t][0].img1;
   
    
    grid[2][t][0].img1 = tmp.img5;
    grid[2][t][0].img2 = BIGX;
    grid[2][t][0].img3 = BIGX;
    grid[2][t][0].img4 = tmp.img4;
    grid[2][t][0].img5 = BIGX;
    grid[2][t][0].img6 = tmp.img1;
    
   
     //migrate edge pieces
     tmp = new mediaBox(grid[2][t][1].x, grid[2][t][1].y, grid[2][t][1].z, 
    grid[1][t][0].sx, grid[1][t][0].sy, grid[1][t][0].sz,
    grid[1][t][0].img1, grid[1][t][0].img2, grid[1][t][0].img3,
    grid[1][t][0].img4, grid[1][t][0].img5, grid[1][t][0].img6);


    grid[1][t][0].img1 = grid[0][t][1].img5;
    grid[1][t][0].img2 = BIGX;
    grid[1][t][0].img3 = BIGX;
    grid[1][t][0].img4 = grid[0][t][1].img4;
    grid[1][t][0].img5 = BIGX;
    grid[1][t][0].img6 = BIGX;
   
    
    grid[0][t][1].img1 = BIGX;
    grid[0][t][1].img2 = BIGX;
    grid[0][t][1].img3 = BIGX;
    grid[0][t][1].img4 = grid[1][t][2].img4;
    grid[0][t][1].img5 = grid[1][t][2].img2;
    grid[0][t][1].img6 = BIGX;
  
    
    grid[1][t][2].img1 = BIGX;
    grid[1][t][2].img2 = grid[2][t][1].img6;
    grid[1][t][2].img3 = BIGX;
    grid[1][t][2].img4 = grid[2][t][1].img4;
    grid[1][t][2].img5 = BIGX;
    grid[1][t][2].img6 = BIGX;
    
    

    grid[2][t][1].img1 = BIGX;
    grid[2][t][1].img2 = BIGX;
    grid[2][t][1].img3 = BIGX;
    grid[2][t][1].img4 = tmp.img4;
    grid[2][t][1].img5 = BIGX;
    grid[2][t][1].img6 = tmp.img1;
    
   }
   
   void up_prime(){
     //println("up prime!");
     counter ++;
     
     int t=0;
     
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[0][t][2].x, grid[0][t][2].y, grid[0][t][2].z, 
    grid[0][t][0].sx, grid[0][t][0].sy, grid[0][t][0].sz,
    grid[0][t][0].img1, grid[0][t][0].img2, grid[0][t][0].img3,
    grid[0][t][0].img4, grid[0][t][0].img5, grid[0][t][0].img6);

    
    grid[0][t][0].img1 = grid[2][t][0].img6;
    grid[0][t][0].img2 = BIGX;
    grid[0][t][0].img3 = BIGX;
    grid[0][t][0].img4 = grid[2][t][0].img4;
    grid[0][t][0].img5 = grid[2][t][0].img1;
    grid[0][t][0].img6 = BIGX;
  

    grid[2][t][0].img1 = grid[2][t][2].img6;
    grid[2][t][0].img2 = BIGX;
    grid[2][t][0].img3 = BIGX;
    grid[2][t][0].img4 = grid[2][t][2].img4;
    grid[2][t][0].img5 = BIGX;
    grid[2][t][0].img6 = grid[2][t][2].img2;
    
    
    grid[2][t][2].img1 = BIGX;
    grid[2][t][2].img2 = grid[0][t][2].img5;
    grid[2][t][2].img3 = BIGX;
    grid[2][t][2].img4 = grid[0][t][2].img4;
    grid[2][t][2].img5 = BIGX;
    grid[2][t][2].img6 = grid[0][t][2].img2;
   
    
    grid[0][t][2].img1 = BIGX;
    grid[0][t][2].img2 = tmp.img5;
    grid[0][t][2].img3 = BIGX;
    grid[0][t][2].img4 = tmp.img4;
    grid[0][t][2].img5 = tmp.img1;
    grid[0][t][2].img6 = BIGX;
    
   
     //migrate edge pieces
     tmp = new mediaBox(grid[0][t][1].x, grid[0][t][1].y, grid[0][t][1].z, 
    grid[1][t][0].sx, grid[1][t][0].sy, grid[1][t][0].sz,
    grid[1][t][0].img1, grid[1][t][0].img2, grid[1][t][0].img3,
    grid[1][t][0].img4, grid[1][t][0].img5, grid[1][t][0].img6);


    grid[1][t][0].img1 = grid[2][t][1].img6;
    grid[1][t][0].img2 = BIGX;
    grid[1][t][0].img3 = BIGX;
    grid[1][t][0].img4 = grid[2][t][1].img4;
    grid[1][t][0].img5 = BIGX;
    grid[1][t][0].img6 = BIGX;
   
    
    grid[2][t][1].img1 = BIGX;
    grid[2][t][1].img2 = BIGX;
    grid[2][t][1].img3 = BIGX;
    grid[2][t][1].img4 = grid[1][t][2].img4;
    grid[2][t][1].img5 = BIGX;
    grid[2][t][1].img6 = grid[1][t][2].img2;
  
    
    grid[1][t][2].img1 = BIGX;
    grid[1][t][2].img2 = grid[0][t][1].img5;
    grid[1][t][2].img3 = BIGX;
    grid[1][t][2].img4 = grid[0][t][1].img4;
    grid[1][t][2].img5 = BIGX;
    grid[1][t][2].img6 = BIGX;
    
    

    grid[0][t][1].img1 = BIGX;
    grid[0][t][1].img2 = BIGX;
    grid[0][t][1].img3 = BIGX;
    grid[0][t][1].img4 = tmp.img4;
    grid[0][t][1].img5 = tmp.img1;
    grid[0][t][1].img6 = BIGX;
   
   }
   
   void down(){
     //println("down!");
     counter ++;
     int t=2;
     
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[0][t][2].x, grid[0][t][2].y, grid[0][t][2].z, 
    grid[0][t][0].sx, grid[0][t][0].sy, grid[0][t][0].sz,
    grid[0][t][0].img1, grid[0][t][0].img2, grid[0][t][0].img3,
    grid[0][t][0].img4, grid[0][t][0].img5, grid[0][t][0].img6);

    
    grid[0][t][0].img1 = grid[2][t][0].img6;
    grid[0][t][0].img2 = BIGX;
    grid[0][t][0].img3 = grid[2][t][0].img3;
    grid[0][t][0].img4 = BIGX;
    grid[0][t][0].img5 = grid[2][t][0].img1;
    grid[0][t][0].img6 = BIGX;
  

    grid[2][t][0].img1 = grid[2][t][2].img6;
    grid[2][t][0].img2 = BIGX;
    grid[2][t][0].img3 = grid[2][t][2].img3;
    grid[2][t][0].img4 = BIGX;
    grid[2][t][0].img5 = BIGX;
    grid[2][t][0].img6 = grid[2][t][2].img2;
    
    
    grid[2][t][2].img1 = BIGX;
    grid[2][t][2].img2 = grid[0][t][2].img5;
    grid[2][t][2].img3 = grid[0][t][2].img3;
    grid[2][t][2].img4 = BIGX;
    grid[2][t][2].img5 = BIGX;
    grid[2][t][2].img6 = grid[0][t][2].img2;
   
    
    grid[0][t][2].img1 = BIGX;
    grid[0][t][2].img2 = tmp.img5;
    grid[0][t][2].img3 = tmp.img3;
    grid[0][t][2].img4 = BIGX;
    grid[0][t][2].img5 = tmp.img1;
    grid[0][t][2].img6 = BIGX;
    
   
     //migrate edge pieces
     tmp = new mediaBox(grid[0][t][1].x, grid[0][t][1].y, grid[0][t][1].z, 
    grid[1][t][0].sx, grid[1][t][0].sy, grid[1][t][0].sz,
    grid[1][t][0].img1, grid[1][t][0].img2, grid[1][t][0].img3,
    grid[1][t][0].img4, grid[1][t][0].img5, grid[1][t][0].img6);


    grid[1][t][0].img1 = grid[2][t][1].img6;
    grid[1][t][0].img2 = BIGX;
    grid[1][t][0].img3 = grid[2][t][1].img3;
    grid[1][t][0].img4 = BIGX;
    grid[1][t][0].img5 = BIGX;
    grid[1][t][0].img6 = BIGX;
   
    
    grid[2][t][1].img1 = BIGX;
    grid[2][t][1].img2 = BIGX;
    grid[2][t][1].img3 = grid[1][t][2].img3;
    grid[2][t][1].img4 = BIGX;
    grid[2][t][1].img5 = BIGX;
    grid[2][t][1].img6 = grid[1][t][2].img2;
  
    
    grid[1][t][2].img1 = BIGX;
    grid[1][t][2].img2 = grid[0][t][1].img5;
    grid[1][t][2].img3 = grid[0][t][1].img3;
    grid[1][t][2].img4 = BIGX;
    grid[1][t][2].img5 = BIGX;
    grid[1][t][2].img6 = BIGX;
    
    

    grid[0][t][1].img1 = BIGX;
    grid[0][t][1].img2 = BIGX;
    grid[0][t][1].img3 = tmp.img3;
    grid[0][t][1].img4 = BIGX;
    grid[0][t][1].img5 = tmp.img1;
    grid[0][t][1].img6 = BIGX;
    
   }
   
   void down_prime(){
     //println("down prime!");
     counter ++;
     int t = 2;
     //migrate corner pieces
       
    mediaBox tmp = new mediaBox(grid[2][t][0].x, grid[2][t][0].y, grid[2][t][0].z, 
    grid[0][t][0].sx, grid[0][t][0].sy, grid[0][t][0].sz,
    grid[0][t][0].img1, grid[0][t][0].img2, grid[0][t][0].img3,
    grid[0][t][0].img4, grid[0][t][0].img5, grid[0][t][0].img6);

    
    grid[0][t][0].img1 = grid[0][t][2].img5;
    grid[0][t][0].img2 = BIGX;
    grid[0][t][0].img3 = grid[0][t][2].img3;
    grid[0][t][0].img4 = BIGX;
    grid[0][t][0].img5 = grid[0][t][2].img2;
    grid[0][t][0].img6 = BIGX;
  

    grid[0][t][2].img1 = BIGX;
    grid[0][t][2].img2 = grid[2][t][2].img6;
    grid[0][t][2].img3 = grid[2][t][2].img3;
    grid[0][t][2].img4 = BIGX;
    grid[0][t][2].img5 = grid[2][t][2].img2;
    grid[0][t][2].img6 = BIGX;
    
    
    grid[2][t][2].img1 = BIGX;
    grid[2][t][2].img2 = grid[2][t][0].img6;
    grid[2][t][2].img3 = grid[2][t][0].img3;
    grid[2][t][2].img4 = BIGX;
    grid[2][t][2].img5 = BIGX;
    grid[2][t][2].img6 = grid[2][t][0].img1;
   
    
    grid[2][t][0].img1 = tmp.img5;
    grid[2][t][0].img2 = BIGX;
    grid[2][t][0].img3 = tmp.img3;
    grid[2][t][0].img4 = BIGX;
    grid[2][t][0].img5 = BIGX;
    grid[2][t][0].img6 = tmp.img1;
    
   
     //migrate edge pieces
     tmp = new mediaBox(grid[2][t][1].x, grid[2][t][1].y, grid[2][t][1].z, 
    grid[1][t][0].sx, grid[1][t][0].sy, grid[1][t][0].sz,
    grid[1][t][0].img1, grid[1][t][0].img2, grid[1][t][0].img3,
    grid[1][t][0].img4, grid[1][t][0].img5, grid[1][t][0].img6);


    grid[1][t][0].img1 = grid[0][t][1].img5;
    grid[1][t][0].img2 = BIGX;
    grid[1][t][0].img3 = grid[0][t][1].img3;
    grid[1][t][0].img4 = BIGX;
    grid[1][t][0].img5 = BIGX;
    grid[1][t][0].img6 = BIGX;
   
    
    grid[0][t][1].img1 = BIGX;
    grid[0][t][1].img2 = BIGX;
    grid[0][t][1].img3 = grid[1][t][2].img3;
    grid[0][t][1].img4 = BIGX;
    grid[0][t][1].img5 = grid[1][t][2].img2;
    grid[0][t][1].img6 = BIGX;
  
    
    grid[1][t][2].img1 = BIGX;
    grid[1][t][2].img2 = grid[2][t][1].img6;
    grid[1][t][2].img3 = grid[2][t][1].img3;
    grid[1][t][2].img4 = BIGX;
    grid[1][t][2].img5 = BIGX;
    grid[1][t][2].img6 = BIGX;
    
    

    grid[2][t][1].img1 = BIGX;
    grid[2][t][1].img2 = BIGX;
    grid[2][t][1].img3 = tmp.img3;
    grid[2][t][1].img4 = BIGX;
    grid[2][t][1].img5 = BIGX;
    grid[2][t][1].img6 = tmp.img1;

   }
   
   void scramble(){
     println("scramble!");
     counter = 0;
     int length = 20; //number of moves for scramble
     String scmoves = "";
     //int[] moves = new int[length];
     for(int i=0; i < length; i++){
       int num = int(random(0,12));
       switch(num){
         case 0: 
           front();
           scmoves+="F ";
           break;
         case 1: 
           front_prime();
           scmoves+="F' ";
           break;
         case 2: 
           back();
           scmoves+="B ";
           break;
         case 3:
           back_prime();
           scmoves+="B' ";
           break;
         case 4: 
           left();
           scmoves+="L ";
           break;
         case 5: 
           left_prime();
           scmoves+="L' ";
           break;
         case 6: 
           right();
           scmoves+="R ";
           break;
         case 7: 
           right_prime();
           scmoves+="R' ";
           break;
         case 8: 
           up();
           scmoves+="U ";
           break;
         case 9: 
           up_prime();
           scmoves+="U' ";
           break;
         
         case 10:
           down();
           scmoves+="D ";
           break;
         case 11:
           down_prime();
           scmoves+="D' ";
           break;
       }
       //add short delay to scramble
       delay(200);
     }
     println("Scrambled! ->"+scmoves);
     counter = 0;
   }
   
   void solve(){
     println("TO BE IMPLEMENTED!");
   }
  void display(){
    //println("test display");
    for (int x=0;x<3;x++)
      for (int y=0;y<3;y++)
        for (int z=0;z<3;z++){
          //println("displaying: "+x+","+y+","+z);
          grid[x][y][z].display();
        }
  }
}