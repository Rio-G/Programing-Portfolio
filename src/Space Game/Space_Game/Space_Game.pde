//Rio Geroux Space Game 1/5/2022
Ship s1;
Star[] stars = new Star[1000];
ArrayList<Aestroid> rocks = new ArrayList<Aestroid>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Timer rockTimer;
int score, level;
boolean play;

void setup() {
  size(1000, 1000);
  s1 = new Ship();
  score =0;
  level = 1;
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  rockTimer = new Timer(1000);
  rockTimer.start();
}

void draw() {
  background(255);
  noCursor();
  infoPanel();

  // Render stars
  for (int i = 0; i<stars.length; i++) {
    stars[i].display();
    stars[i].move();
  }

  // Timer for rocks
  if (rockTimer.isFinished()) {
    rocks.add(new Aestroid(int(random(width)), -100));
    rockTimer.start();
  }

  // Render the rocks and detect ship collision
  for (int i = 0; i < rocks.size(); i++) {
    Aestroid rock = rocks.get(i);
    rock.display();
    rock.move();
    if (rock.reachedBottom()) {
      rocks.remove(rock);
    }
  }

  // Render the lasers and detect rock collision
  for (int i = 0; i < lasers.size(); i++) {
    Laser laser = lasers.get(i);
    for (int j = 0; j<rocks.size(); j++) {
    }
    laser.display();
    laser.move();
    if (laser.reachedTop()) {
      lasers.remove(laser);
    }
  }

  // render ship
  s1.display(mouseX, 730);
  println(lasers.size());
}

void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 0, width, 60);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Score:" + score + "Level:" + level + "Health:" + s1.health + "Ammo:" + s1.laserCount, width/2, 50);
}

void startScreen() {
}

void gameOver() {
}

void ticker() {
}

void mousePressed() {
  lasers.add(new Laser(s1.x, s1.y));
  s1.laserCount--;
}

void keyPressed() {
  if (keyPressed) {
    if (key == ' ') {

      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount--;
    }
  }
}
