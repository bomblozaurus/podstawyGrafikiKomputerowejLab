abstract class AstronomicalObject{
  int positionX, positionY;
  color c = -1;
  float radius;
  PShape sphere;

  AstronomicalObject(float radius, color c){ 
    this.radius = radius;
    this.c=c;
    sphere = createShape(SPHERE, radius/2);
  }

  AstronomicalObject(float radius, PImage img){
    this.radius = radius;
    sphere = createShape(SPHERE, radius/2);
    sphere.setTexture(img);
  }

  AstronomicalObject(float radius, int positionX, int positionY, color c){ 
    this(radius, c);
    this.positionX = positionX;     
    this.positionY = positionY;      
  } 
  
  AstronomicalObject(float radius, int positionX, int positionY, PImage img){ 
    this(radius, img);
    this.positionX = positionX;     
    this.positionY = positionY;      
  }
      
  abstract void move();        
   
  void drawIt(){ 
    pushMatrix();  
    {  
      if(c != -1){
        fill(c);
      }
      shape(sphere);
    } 
    popMatrix(); 
  }
} 
