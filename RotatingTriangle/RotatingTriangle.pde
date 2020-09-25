final float OPACITY = 50;
final int n = 6;  //number of triangles
final float minr = 60; //radius of smallest triangle
final float a = 0; //starting angle of triangle
final float c = 255; //starting colour
boolean rotdir = true; //direction of the rotation of each triangle. True of clockwise. 

Triangle[] t;

PGraphics pg;

void setup(){
  
  frameRate(128);
  background(0);
  size(700, 700);
  
  t = new Triangle[n];
  
  for(int i = 0; i < n; i++){
    t[i] = new Triangle((i+1)*minr, //each triangle's radius is a multiple of minr. They grow linearly
                        a, 
                        rotdir, 
                        (float((n-i))/n)*c); //the colour is proportionally dark the bigger the triangle
    rotdir = !rotdir;
  }
  
}

void draw(){
  drawBackground();
  translate(width/2, height/2);
  for(int i = n-1; i >= 0; i--){
    t[i].update();
  }

}

void drawBackground(){  //attempt at creating a fazing/motion-blur effect on the motiion of the triangles. 
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(0, OPACITY);
  pg.endDraw();
  image(pg, 0, 0);
}
