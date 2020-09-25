public class Triangle{
  
  private final float angv = TWO_PI/pow(2, 9);  //angular velocity of the rotation
  
  private float r; //radius of the triangle
  private float a; //angle of the drawing
  private boolean rotdir; //direction of the rotation
  private float c; //colour
  
  Triangle(float r, float a, boolean rotdir, float c) {  
    this.r = r;
    this.a = a;
    this.rotdir = rotdir;
    this.c = c;
  }
  
  void drawTriangle(){
    push();  //visual settings should only be appicable in this instance
    
    rotate(this.a);  //rotate the image
    
    fill(this.c); //white
    noStroke();
    
    beginShape();  //draw the triangle building it from the three vertices. 
    for(int i = 0; i < 3; i++){  //the choords are obtained from the radius and the imaginary circumscribed circle 
      float x = this.r*cos(i*TWO_PI/3);
      float y = this.r*sin(i*TWO_PI/3);
      vertex(x, y);
    }
    endShape(CLOSE);
    
    if(this.rotdir) this.a -= this.angv;
    else this.a += this.angv;
    
    pop();
  }
  
  void update(){
    this.drawTriangle();
  }
  
}
