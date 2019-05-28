class Spaceship {  //<>//
  PVector position, direction = new PVector(1, 0, 0);
  float rotateX, rotateY, rotateZ;
  float velocity = 1.f, distance = 1;
  boolean forward, backward, left, right, up, down;
  PShape shape;

  Spaceship(PShape shape) {
    this.shape = shape;
    rotateX = rotateY = rotateZ = 0.f;
    position = new PVector(500, 500, 100);
  }

  void move() {
    checkFlags();

    pushMatrix();
    translate(position.x, position.y, position.z);
    rotateX(radians(rotateX));
    rotateY(radians(rotateY));
    rotateZ(radians(rotateZ));
    drawIt();
    popMatrix();
  }

  void checkFlags() {
    if (left) rotateY +=1;
    if (right) rotateY -=1;
    if (up) rotateZ +=1;
    if (down) rotateZ -=1;

    updateDirection();

    if (forward) velocity = {
      Math.abs(velocity);
    calculateNewPosition();

    }
    if (backward) {
      velocity = -(Math.abs(velocity));
    calculateNewPosition();
    }

  }

  void updateDirection(){
    PVector newDirection = new PVector(1,0,0);

    rotateAroundX(newDirection);
    rotateAroundZ(newDirection);
    rotateAroundY(newDirection);
    this.direction = newDirection;
  }

  void calculateNewPosition() {}
    this.position.add(newDirection.mult(velocity));
  }

  private void rotateAroundX(PVector direction) {
    double cos = Math.cos(radians(rotateX));
    double sin = Math.sin(radians(rotateX));

    double newY = direction.y * cos - direction.z * sin;
    double newZ = direction.y * sin + direction.z * cos;

    direction.y = (float) newY;
    direction.z = (float) newZ;
  }

  private void rotateAroundY(PVector direction) {
    double cos = Math.cos(radians(rotateY));
    double sin= Math.sin(radians(rotateY));

    double newX = direction.x * cos + direction.z * sin;
    double newZ = (-1) * direction.x * sin + direction.z * cos;

    direction.x = (float) newX;
    direction.z = (float) newZ;
  }

  private void rotateAroundZ(PVector direction) {
    double cos = Math.cos(radians(rotateZ));
    double sin = Math.sin(radians(rotateZ));

    double newX = direction.x * cos - direction.y * sin;
    double newY = direction.x * sin + direction.y * cos;

    direction.x = (float) newX;
    direction.y = (float) newY;
  }

  void fpsCamera() {
    camera.jump(position.x, position.y, position.z);
    camera.aim(position.x + direction.x, position.y + direction.y, position.z + direction.z);
  }
  
  void updateCamera(){
    
  }

  void drawIt() {
    shape(shape);
  }
}
