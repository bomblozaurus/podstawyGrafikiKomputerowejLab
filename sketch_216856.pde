void setup() {
  size(640, 480, P2D);
  noStroke();
  init();
}

float timer = 0.f;

ArrayList <AstronomicalObject> objects = new ArrayList <AstronomicalObject>();

void draw()
{
  background(0);
  for(AstronomicalObject object : objects){  //<>// //<>//
    object.move();
  }

  timer +=0.1f;
}

void init(){  //<>// //<>//
  Star star = new Star(50, width/2, height/2, #ffff00);
  Planet planet = new Planet(25, star, 125, 0.3f, #0000ff);
  Moon moon = new Moon(15, planet, 45, 0.5f, #00ff00);
  planet.add(moon);

  
  }

abstract class AstronomicalObject{
  int radius, positionX, positionY;
  color c;

  abstract move();
}

class Star extends AstronomicalObject{
  Star(int radius, int positionX, int positionY, int c){ //<>//
    this.radius = radius; //<>//
    this.c = c; //<>//
    this.positionX = positionX;
    this.positionY = positionY;
  } 

  void move(){
    pushMatrix(); //<>//
      { //<>//
        translate(orbitX, orbitY);  //<>//
        drawIt();  //<>//
      } //<>//
    popMatrix();
  }
}

class Planet extends AstronomicalObject{
float speed;
int orbitRadius;
ArrayList <AstronomicalObject> moons = new ArrayList<AstronomicalObject>();

Planet(int radius, Star star, int orbitRadius, float speed, int c){
  this.speed = speed;
  super(radius, c);
  setOrbit(star.positionX, star.positionY, orbitRadius);
}

void setOrbit(int x, int y, float orbitRadius){ 
    this.orbitX = x; 
    this.orbitY = y;
    this.orbitRadius = orbitRadius;
}

void addMoon(AstronomicalObject moon){
  if(moon.radius < this.radius){
    moons.add(moon);
  }
}

void drawMoons(){
  for(AstronomicalObject moon: moons){ //<>//
     pushMatrix(); //<>//

     translate(moon.orbitX, moon.orbitY);   //<>//
     rotate((float)timer * moon.speed);   //<>//
     translate(moon.orbitRadius, 0);  
     moon.drawIt();  
       
     popMatrix();
    }
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

class Moon extends Planet{
  Moon(int radius, Planet planet, int orbitRadius, float speed, int c){
    this.radius = radius;
    this.speed = speed;
    this.c = c;
    this.orbitRadius = orbitRadius;
  }
}
