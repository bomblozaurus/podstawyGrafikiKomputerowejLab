abstract class AstronomicalObject{
  int positionX, positionY;
  color c;
  float radius;
  AstronomicalObject(float radius, color c){ 
    this.radius = radius;
    this.c=c;
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
      ellipse(0, 0, radius, radius);
    } 
    popMatrix(); 
  }
} 
