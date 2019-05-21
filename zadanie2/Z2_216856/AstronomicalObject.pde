abstract class AstronomicalObject{
  int positionX, positionY;
  float radius;
  PShape sphere;

  AstronomicalObject(float radius, color c){ 
    this.radius = radius;
    sphere = createShape(SPHERE, radius/2);
    sphere.setFill(c);
  }

  AstronomicalObject(float radius, PImage img){
    this.radius = radius;
    sphere = createShape(SPHERE, radius/2);
    sphere.setTexture(img);
  }

  AstronomicalObject(float radius, PShape shape, float scale){
    this.radius = radius;
    shape.scale(scale);
    sphere = shape;
  }

  AstronomicalObject(float radius, int positionX, int positionY, color c){ 
    this(radius, c);
    this.positionX = positionX;     
    this.positionY = positionY;      
  } 
  
  AstronomicalObject(float radius, int positionX, int positionY, PImage img){ 
    this(radius, img);
    this.positionX = positionX;     
    this.positionY = positionY;      
  }

  AstronomicalObject(float radius, int positionX, int positionY, PShape shape, float scale){ 
    this(radius, shape, scale);
    this.positionX = positionX;     
    this.positionY = positionY;      
  }
      
  abstract void move();        
   
  void drawIt(){ 
    pushMatrix();  
    {  
      shape(sphere);
    } 
    popMatrix(); 
  }

  private float getScale(PShape shape, float radius){
    if(shape.getVertexCount()<0){
      throw new IllegalArgumentException("Shape has no vertecies");
    }
    float xMin, xMax, yMin, yMax, zMin, zMax;
    PVector vertex = shape.getVertex(0);
    xMin = xMax = vertex.x;
    yMin = yMax = vertex.y;
    zMin = zMax = vertex.z;
    for(int i=1;i<shape.getVertexCount(); i++){
      vertex = shape.getVertex(i);

      if(vertex.x < xMin) {
        xMin = vertex.x;
      } else if (vertex.x > xMax){
        xMax = vertex.x;
      }

      if(vertex.y < yMin) {
        yMin = vertex.y;
      } else if (vertex.y > yMax){
        yMax = vertex.y;
      }

      if(vertex.z < zMin) {
        zMin = vertex.z;
      } else if (vertex.z > zMax){
        zMax = vertex.z;
      }
    }

    java.util.List<Float> list = java.util.Arrays.asList(new Float[] {xMax - xMin, yMax - yMin, zMax - zMin});
    float scale = radius / java.util.Collections.max(list);

    return scale;
  }
} 
