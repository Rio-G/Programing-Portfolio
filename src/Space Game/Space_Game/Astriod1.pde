class Aestroid {
  int x, y, diam, speed, rand;
  PImage aestroid;

  Aestroid(int x, int y) {
    this.x = x;
    this.y = y;
    diam = int(random(30, 90));
    speed = int(random(2, 7));
    rand = int(random(3));
    if (rand == 0) {
      aestroid = loadImage("rock1.png");
    } else if (rand == 1) {
      aestroid = loadImage("rock2.png");
    } else if (rand == 2) {
      aestroid = loadImage("rock3.png");
    }
  }

  void display() {
    fill(#937A35);
    imageMode(CENTER);
    image(aestroid, x, y);
    //ellipse(x,y,diam,diam);
  }

  void move() {
    y+=speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }
}
