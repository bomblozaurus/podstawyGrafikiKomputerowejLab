class Star extends AstronomicalObject{
  Star(float radius, int positionX, int positionY, int c){  
    super(radius, positionX, positionY,c); 
  } 
  
  Star(float radius, int positionX, int positionY, PImage img){  
    super(radius, positionX, positionY,img); 
  } 
 
  void move(){ 
    pushMatrix(); 
      { 
        translate(positionX, positionY);  
        drawIt();  
        shine();
      }  
    popMatrix(); 
  }

  void shine(){
    pointLight(150,150,0,0,0,0);
  }
} 
