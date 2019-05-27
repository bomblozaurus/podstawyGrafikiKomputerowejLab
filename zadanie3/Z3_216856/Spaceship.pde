class Spaceship {
  int posX, posY, posZ;
  float rotateX, rotateY, rotateZ;
  boolean moveForward, moveBackward, moveLeft, moveRight, rotateUp, rotateDown;
  PShape shape;

  Spaceship(PShape shape) {
    this.shape = shape;
    rotateX = rotateY = rotateZ = 0.f;
    posX = posY = posZ = 0;
  }

  Spaceship(int posX, int  posY, int  posZ, PShape shape) {
    this(shape);
    this.posX = posX;
    this.posY = posY;
    this.posZ = posZ;
  }

  Spaceship(int posX, int  posY, int  posZ, float  rotateX, float rotateY, float rotateZ, PShape shape) {
    this(posX, posY, posZ, shape);
    this.rotateX = rotateX;
    this.rotateY = rotateY;
    this.rotateZ = rotateZ;
  }

  void move() {
    pushMatrix();
    checkFlags();
    rotateX(radians(rotateX));
    rotateY(radians(rotateY));
    rotateZ(radians(rotateZ));
    translate(posX, posY, posZ);
    drawIt();
    popMatrix();
  }

  void checkFlags() {
    if (moveForward) posZ +=1;
    if(moveBackward) posZ -=1;
    if(moveRight) posX-=1;
    if(moveLeft) posX+=1;
    if(rotateUp) posY -=1;;
    if(rotateDown) posY +=1;;
  }
    void drawIt() {
      shape(shape);
    }
  }
