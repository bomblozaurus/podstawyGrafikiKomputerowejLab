class PeopledPlanet extends Planet{
    PeopledPlanet(float radius, AstronomicalObject object, int orbitRadius, float offset, float speed, int c){
        super(radius, object, orbitRadius, offset, speed,c);  
    }

    PeopledPlanet(float radius, AstronomicalObject object, int orbitRadius, float offset, float speed, PImage img){
        super(radius, object, orbitRadius, offset, speed,img);  
    }

    void move(){
    pushMatrix();
      {
        super.move();
        shine();
      }
    popMatrix();
    } 

    void shine(){
        spotLight(255,255,255, 0,0,0, 0,-1000,0,radians(45), 1);
    }

}
