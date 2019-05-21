class Moon extends Planet{
  Moon(int radius, Planet planet, int orbitRadius, float offset, float speed, int c){
    super(radius, planet, orbitRadius, offset, speed, c);
  }

   Moon(int radius, Planet planet, int orbitRadius, float offset, float speed, PImage img){
    super(radius, planet, orbitRadius, offset, speed, img);
  }
}
