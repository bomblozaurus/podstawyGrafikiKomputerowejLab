import peasy.*;
import queasycam.*;
import damkjer.ocd.*;

float timer = 3.5f;
final int garbageNumber = 750;
int counter = 0;

ArrayList <AstronomicalObject> astronomicalObjects;
ArrayList <Garbage> garbage;
Spaceship spaceship;

PImage sun, moon, earth, pluto;
PShape object, spaceshipModel;

Camera camera;

int cameraSwitch;

void setup() {
  size(1600, 900, P3D);
  noStroke();

  sun = loadImage("sun.jpg");
  moon = loadImage("moon.jpg");
  earth = loadImage("earth.jpg");
  pluto = loadImage("pluto.jpg");

  object = loadShape("teaPot.obj");
  object.rotateX(PI);

  spaceshipModel = loadShape("spaceship/SpaceShip.obj");
  spaceshipModel.scale(2);
  spaceshipModel.rotateX(PI);
  spaceshipModel.rotateY(radians(-90));

  init();

  camera = new Camera(this);
}

void draw()
{      
  background(0);
  lights();
  switch(cameraSwitch) {
  case 1:
    spaceship.fpsCamera();
    break;
  case 2:
    spaceship.sideCamera();
    break;
  case 3:
    spaceship.tpsCamera();
    break;
  }

  //spaceship.tpsCamera();
  camera.feed();

  for (Garbage g : garbage) {
    g.move();
  }

  spaceship.move();

  for (AstronomicalObject object : astronomicalObjects) {        
    object.move();
  }

  timer +=0.1f;
} 

void init() {        
  astronomicalObjects = new ArrayList <AstronomicalObject>();
  garbage = new ArrayList<Garbage>();

  for (int i=0; i<garbageNumber; i++) {
    garbage.add(new Garbage());
  }

  Star star = new Star(120, width/2, height/2, sun);
  Planet planet1 = new Planet(25, star, 120, 10, -0.3f, pluto);
  Moon moon11 = new Moon(6, planet1, 20, 0, -0.5f, #ca0ee8);     
  Moon moon12 = new Moon(10, planet1, 35, -2, 0.35f, #e80b6b);     
  planet1.addMoon(moon11);     
  planet1.addMoon(moon12);

  Planet planet2 = new Planet(30, star, 235, -5, 0.2f, earth); 
  Moon moon21 = new Moon(8, planet2, 30, 10, -0.3f, #84e80b); 
  Moon moon22 = new Moon(11, planet2, 44, -50, 0.25f, #b28579);
  Moon moon23 = new Moon(14, planet2, 60, 41, 0.15f, #e08fb5);     
  planet2.addMoon(moon21);     
  planet2.addMoon(moon22);     
  planet2.addMoon(moon23);       

  Planet planet3 = new Planet(40, star, 350, 14, 0.1f, object, 12.5);   
  Moon moon31 = new Moon(12, planet3, 35, -7, .3f, #f7674a); 
  planet3.addMoon(moon31); 

  PeopledPlanet planet4 = new PeopledPlanet(55, star, 450, 0, -0.05f, #4a5e72);
  Moon moon41 = new Moon(20, planet3, 50, 90, .4f, moon);
  planet4.addMoon(moon41); 

  astronomicalObjects.add(star); 
  astronomicalObjects.add(planet1);  
  astronomicalObjects.add(planet2);  
  astronomicalObjects.add(planet3);
  astronomicalObjects.add(planet4);

  spaceship = new Spaceship(spaceshipModel, 500, 100, -100);
}  

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) spaceship.up = true;
    if (keyCode == DOWN) spaceship.down = true;
  }

  if (key == 'w') spaceship.forward = true;
  if (key == 's') spaceship.backward = true;
  if (key == 'a') spaceship.left = true;
  if (key == 'd') spaceship.right = true;
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP) spaceship.up = false;
    if (keyCode == DOWN) spaceship.down = false;
  }

  if (key == 'w') spaceship.forward = false;
  if (key == 's') spaceship.backward = false;
  if (key == 'a') spaceship.left = false;
  if (key == 'd') spaceship.right = false;
}

void keyTyped() {
  if (key == '1') cameraSwitch = 1;
  if (key == '2') cameraSwitch = 2;
  if (key == '3') cameraSwitch = 3;
  
 if(key == '[') astronomicalObjects.get(0).positionX += 10;
 if(key == ']') astronomicalObjects.get(0).positionX -= 10;
 if(key == ';') astronomicalObjects.get(0).positionY += 10;
 if(key == '\'') astronomicalObjects.get(0).positionY -= 10;
}

void mouseWheel(MouseEvent event) {
  spaceship.velocity -= event.getCount();
  if (spaceship.velocity <1) spaceship.velocity=1.f;
}
