class Moon extends Planet {
  Moon(int radius, Planet planet, int orbitRadius, float offset, float speed, int c) {
    super(radius, planet, orbitRadius, offset, speed, c);
  }

  Moon(int radius, Planet planet, int orbitRadius, float offset, float speed, PImage img) {
    super(radius, planet, orbitRadius, offset, speed, img);
  }

  void move() {
    pushMatrix(); 

    translate(orbitX, orbitY);   
    rotateX(timer * 0.01f * speed);
    rotateZ(radians(offset)); 
    rotateY((float)timer * speed);   
    translate(orbitRadius, 0);  
    drawIt();  

    popMatrix();
  }
}
