float timer = 0.f;
final int garbageNumber = 750;

ArrayList <AstronomicalObject> astronomicalObjects;
ArrayList <Garbage> garbage;

void setup() {
  size(1900, 1060, P2D);
  noStroke();
  init();
}

void draw()
{      
  background(0);
  for(AstronomicalObject object : astronomicalObjects){        
    object.move();
  }

  for(Garbage g : garbage){
    g.move();     
  }

  timer +=0.1f;
} 

void init(){        
  astronomicalObjects = new ArrayList <AstronomicalObject>();
  garbage = new ArrayList<Garbage>();
  
  for(int i=0;i<garbageNumber; i++){
    garbage.add(new Garbage());
  }

  Star star = new Star(120, width/2, height/2, #ffff00);

  Planet planet1 = new Planet(25, star, 120, -0.3f, #e80f0b);
  Moon moon11 = new Moon(6, planet1, 20, -0.5f, #ca0ee8);     
  Moon moon12 = new Moon(10, planet1, 35, 0.35f, #e80b6b);     
  planet1.addMoon(moon11);     
  planet1.addMoon(moon12);
 
  Planet planet2 = new Planet(30, star, 235, 0.2f, #0b5ce8); 
  Moon moon21 = new Moon(8, planet2, 30, -0.3f, #84e80b); 
  Moon moon22 = new Moon(11, planet2, 44, 0.25f, #0be876);
  Moon moon23 = new Moon(14, planet2, 60, 0.15f, #e08fb5);     
  planet2.addMoon(moon21);     
  planet2.addMoon(moon22);     
  planet2.addMoon(moon23);       
        
  Planet planet3 = new Planet(40, star ,350 ,0.1f ,#06e29d);   
  Moon moon31 = new Moon(12, planet3, 35, .3f, #f7674a); 
  planet3.addMoon(moon31); 
 
  Planet planet4 = new Planet(55, star, 450,-0.05f , #4a5e72);
  Moon moon41 = new Moon(20, planet3, 50, .4f, #b28579);
  planet4.addMoon(moon41); 
   
   
  astronomicalObjects.add(star); 
  astronomicalObjects.add(planet1);  
  astronomicalObjects.add(planet2);  
  astronomicalObjects.add(planet3);
  astronomicalObjects.add(planet4);
  
  }  
 
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
 
class Star extends AstronomicalObject{
  Star(float radius, int positionX, int positionY, int c){  
    super(radius, positionX, positionY,c); 
  } 
 
  void move(){ 
    pushMatrix(); 
      { 
        translate(positionX, positionY);  
        drawIt();  
      }  
    popMatrix(); 
  }
} 
 
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



class Moon extends Planet{
  Moon(int radius, Planet planet, int orbitRadius, float speed, int c){
    super(radius, planet, orbitRadius, speed, c);
  }
}

class Garbage extends Star{
  Garbage(){
    super(random(0.5, 2.5),(int) random(-1.f * width, 2.f*width),(int) random(-1.f * height, 3.f*height),(int) random(50,200));
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
