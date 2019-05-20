class Planet extends AstronomicalObject{
float speed, orbitRadius;
int orbitX, orbitY;
ArrayList <Moon> moons = new ArrayList<Moon>(); 
 
Planet(float radius, AstronomicalObject object, int orbitRadius, float speed, int c){
  super(radius, c);  
  this.speed = speed;  
  setOrbit(object.positionX, object.positionY, orbitRadius);
} 
 
void setOrbit(int x, int y, float orbitRadius){ 
    this.orbitX = x; 
    this.orbitY = y;
    this.orbitRadius = orbitRadius;
}

void addMoon(Moon moon){
  if(moon.radius < this.radius){
    moons.add(moon);
  }
}

void drawMoons(){
  for(Moon moon: moons){ 
     pushMatrix(); 

     translate(moon.orbitX, moon.orbitY);   
     rotate((float)timer * moon.speed);   
     translate(moon.orbitRadius, 0);  
     moon.drawIt();  
       
     popMatrix();
    }
  }

  void move(){
    pushMatrix();
      {
        translate(orbitX, orbitY); 
        rotate((float)timer * speed); 
        translate(orbitRadius, 0); 
        drawIt(); 
        drawMoons();
      }
    popMatrix();
  } 
}
