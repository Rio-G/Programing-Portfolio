class Ship {
  //Member Variables
  int x, y, w, health, laserCount;
  boolean active;
  PImage ship;

  //constructor
  Ship() {
    x = 0;
    y = 0;
    w = 50;
    health = 100;
    laserCount = 500;
    active = true;
    ship = loadImage("SHIPP.png");
  }

  // Memeber Metheds
  void display(int x, int y) {
    this .x = x;
    this .y = y;
    imageMode(CENTER);
    ship.resize(80, 80);
    image(ship, x, y);
  }

  void move() {
  }


  boolean intersect(Aestroid a) {
    return true;
  }
}
