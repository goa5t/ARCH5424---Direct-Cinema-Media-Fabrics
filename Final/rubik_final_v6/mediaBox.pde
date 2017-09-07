
class mediaBox{
  float x, y, z; //location of cube
  float sx, sy, sz;//size of cube
  //float rx, ry, rz;
  float dx, dy, dz;
  float xcenter, ycenter, zcenter;
  PImage img1, img2, img3, img4, img5, img6;

 mediaBox(float xl, float yl, float zl, float xd, float yd, float zd, PImage i1, PImage i2, PImage i3, PImage i4, PImage i5, PImage i6){
   x = xl;
   y = yl;
   z = zl;
   sx = xd;
   sy = yd;
   sz = zd;
   //rx = 0;
   //ry = 0;
   //rz = 0;
   img1 = i1;
   img2 = i2;
   img3 = i3;
   img4 = i4;
   img5 = i5;
   img6 = i6;
   //calculate centroid
   xcenter = (x + (x + sx)) / 2.0;
   ycenter = (y + (y + sy)) / 2.0;
   zcenter = (z +(z + sz)) / 2.0;
   
 }
 
 //void setImages(PImage i1, PImage i2, PImage i3, PImage i4, PImage i5, PImage i6, float rotx, float roty, float rotz){
   void setImages(mediaBox input){
   img1 = input.img1;
   img2 = input.img2;
   img3 = input.img3;
   img4 = input.img4;
   img5 = input.img5;
   img6 = input.img6;
   //rx = input.rx;
   //ry = input.ry;
   //rz = input.rz;
 }
 
 mediaBox copy(){
   
   mediaBox tmp = new mediaBox(this.x, this.y, this.z, this.sx, this.sy, this.sz, this.img1, this.img2, this.img3, this.img4, this.img5, this.img6);
   //tmp.rx = this.rx;
   //tmp.ry = this.ry;
   //tmp.rz = this.rz;
   
   return tmp;
 }
 
/*
 void rotX(float rotX){
   rx += rotX;
 }
 
 void rotY(float rotY){
   ry += rotY; 
 }
 
 void rotZ(float rotZ){
   rz += rotZ;
 }
 */
 
 void updateCenter(float inx, float iny, float inz){
   this.xcenter = inx;
   this.ycenter = iny;
   this.zcenter = inz;
 }
 
 mediaBox clone(){
   return this;
 }
 
 void display(){
   //box
   pushMatrix();
     //translate(x, y, z);
     
     fill(122);
     //ellipse(0, 0, 20, 20);
     translate(xcenter, ycenter, zcenter);
     //rotateX(rx);
     //rotateY(ry);
     //rotateZ(rz);
     
     //translate((x + (x + sx)) / 2.0, (y + (y + sy)) / 2.0, (z + (z + sz)) / 2.0);
     
     //box
     beginShape();//back face
       vertex(-(sx/2.0), -(sy/2.0), -(sz/2.0));
       vertex((sx/2.0), -(sy/2.0), -(sz/2.0));
       vertex((sx/2.0), (sy/2.0), -(sz/2.0));
       vertex(-(sx/2.0), (sy/2.0), -(sz/2.0));
    endShape(CLOSE);
    /*
    beginShape();//front face
       vertex(0, 0, sz);
       vertex(sx, 0, sz);
       vertex(sx, sy, sz);
       vertex(0, sy, sz);
     endShape(CLOSE);
     */
     beginShape();//top face
       vertex(-(sx/2.0), -(sy/2.0), -(sz/2.0));
       vertex(-(sx/2.0), -(sy/2.0), (sz/2.0));
       vertex((sx/2.0), -(sy/2.0), (sz/2.0));
       vertex((sx/2.0), -(sy/2.0), -(sz/2.0));
     endShape(CLOSE);
     beginShape();//bottom face
       vertex(-(sx/2.0), (sy/2.0), -(sz/2.0));
       vertex(-(sx/2.0), (sy/2.0), (sz/2.0));
       vertex((sx/2.0), (sy/2.0), (sz/2.0));
       vertex((sx/2.0), (sy/2.0), -(sz/2.0));
     endShape(CLOSE);
     beginShape();//left face
       vertex(-(sx/2.0), (sy/2.0), -(sz/2.0));
       vertex(-(sx/2.0), (sy/2.0), (sz/2.0));
       vertex(-(sx/2.0), -(sy/2.0), (sz/2.0));
       vertex(-(sx/2.0), -(sy/2.0), -(sz/2.0));
     endShape(CLOSE);
     beginShape();//right face
       vertex((sx/2.0), (sy/2.0), -(sz/2.0));
       vertex((sx/2.0), (sy/2.0), (sz/2.0));
       vertex((sx/2.0), -(sy/2.0), (sz/2.0));
       vertex((sx/2.0), -(sy/2.0), -(sz/2.0));
     endShape(CLOSE);
     
     //image1
     pushMatrix();
       float nominalDist = 0.03;
       translate(-(sx/2.0)+nominalDist, -(sy/2.0)+nominalDist, -(sz/2.0)-nominalDist);
       image(img1,0, 0, sx, sy);
     popMatrix();
     
     //image2
     pushMatrix();
       translate(-(sx/2.0)+nominalDist, -(sy/2.0)+nominalDist, (sz/2.0) + nominalDist);
       image(img2,0, 0, sx, sy);
     popMatrix();
     
     //image3
     pushMatrix();
       translate(-(sx/2.0)+nominalDist, (sy/2.0) + nominalDist, (sz/2.0) + nominalDist);
       rotateX(radians(270));
       image(img3,0, 0, sx, sy);
     popMatrix();
     
     //image4
     pushMatrix();
       translate(-(sx/2.0)+nominalDist, -(sy/2.0)-nominalDist, (sz/2.0) + nominalDist);
       rotateX(radians(270));
       image(img4,0, 0, sx, sy);
     popMatrix();
     
     //image5
     pushMatrix();
       translate(-(sx/2.0)-nominalDist, -(sy/2.0)+nominalDist, (sz/2.0) + nominalDist);
       rotateY(radians(90));
       image(img5,0, 0, sx, sy);
     popMatrix();
     //image6
     pushMatrix();
       translate(((sx/2.0) + nominalDist), -(sy/2.0)+nominalDist, -(sz/2.0) + nominalDist);
       rotateY(radians(270));
       image(img6,0, 0, sx, sy);
     popMatrix();
     
   popMatrix();
 
   
 }
}