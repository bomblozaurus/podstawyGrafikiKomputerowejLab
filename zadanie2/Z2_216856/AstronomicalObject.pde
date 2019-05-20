abstract class AstronomicalObject{
  int positionX, positionY;
  color c;
  float radius;
  PImage img;
  PShape sphere;

  AstronomicalObject(float radius, color c){ 
    this.radius = radius;
    this.c=c;
  }

  AstronomicalObject(float radius, PImage img){
    this.radius = radius;
    this.img = img;
  }

  AstronomicalObject(float radius, int positionX, int positionY, color c){ 
    this(radius, c);
    this.positionX = positionX;     
    this.positionY = positionY;      
  } 
      
  abstract void move();        
   
  void drawIt(){ 
    pushMatrix();  
    {  
      fill(c); 
      sphere(radius/2);
    } 
    popMatrix(); 
  }
} 
