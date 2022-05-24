class Button {
  // Memebr Variables
  float x, y, w, h;
  boolean  on;
  String val;
  // Constroctor
  Button(float tempX, float tempY, float tempW, float tempH, String tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    on = false;
  }

  // Method for Display
  void display() {
    if (!on) {
      fill(128);
    } else {
      fill(222);
    }
    rect(x, y, w, h, 5);
    fill(255);
    text(val, x+15, y+25);
  }
  // Method to detect mouseover
  void hover(int mx, int my) {
    on = (mx>x && mx<x+w && my>y && my<y+h);
  }
}
