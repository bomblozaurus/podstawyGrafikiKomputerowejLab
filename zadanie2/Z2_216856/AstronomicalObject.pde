abstract class AstronomicalObject{
  int positionX, positionY;
  float radius;
  PShape sphere;

  AstronomicalObject(float radius, color c){ 
    this.radius = radius;
    sphere = createShape(SPHERE, radius/2);
    sphere.setFill(c);
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
      shape(sphere);
    } 
    popMatrix(); 
  }
} 
