class Star extends AstronomicalObject{
  Star(float radius, int positionX, int positionY, int c){  
    super(radius, positionX, positionY,c); 
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
