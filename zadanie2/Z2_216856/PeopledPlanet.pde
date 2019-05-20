class PeopledPlanet extends Planet{
    PeopledPlanet(float radius, AstronomicalObject object, int orbitRadius, float offset, float speed, int c){
        super(radius, object, orbitRadius, offset, speed,c);  
    }

    void move(){
    pushMatrix();
      {
        translate(orbitX, orbitY);
        rotateZ(radians(offset)); 
        rotateY((float)timer * speed); 
        translate(orbitRadius, 0); 
        rotateZ(radians(-offset));
        shine();
        drawIt(); 
        drawMoons();
      }
    popMatrix();
    } 

    void shine(){
        spotLight(255,255,255, 0,0,0, 0,1000,0,radians(45), 1);
    }

}
