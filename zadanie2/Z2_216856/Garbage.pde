class Garbage extends AstronomicalObject{
  Garbage(){
    super(random(0.5, 2.5),(int) random(-1.f * width, 2.f*width),(int) random(-1.f * height, 3.f*height),(int) random(50,200));
  }

  void drawIt(){ 
    pushMatrix();  
    {  
      fill((int)Math.random() * 200 + 20); 
      ellipse(0,0, radius, radius);
    } 
    popMatrix(); 
  }

  void move(){ 
    pushMatrix(); 
      {
        translate(width * 2 / 3.0f, -80);
        rotate(timer/50.f);
        translate(positionX, positionY);  
        drawIt();
      }  
    popMatrix(); 
  }
}
