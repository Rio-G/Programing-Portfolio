//Rio Geroux’s 2021 Calc| Oct 21//
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[7];
String dVal="0";
String op = "";
boolean left = true;
float r = 0.0;
float l = 0.0;
float result = 0.0;
PImage background;
void setup() {
  background = loadImage("sunny.png");
  size(320, 385);
  fill(245, 245, 220);
  numButtons[0] = new Button(30, 305, 50, 50, "0");
  numButtons[1] = new Button(30, 235, 50, 50, "1");
  numButtons[2] = new Button(100, 235, 50, 50, "2");
  numButtons[3] = new Button(170, 235, 50, 50, "3");
  numButtons[4] = new Button(30, 165, 50, 50, "4");
  numButtons[5] = new Button(100, 165, 50, 50, "5");
  numButtons[6] = new Button(170, 165, 50, 50, "6");
  numButtons[7] = new Button(30, 95, 50, 50, "7");
  numButtons[8] = new Button(100, 95, 50, 50, "8");
  numButtons[9] = new Button(170, 95, 50, 50, "9");
  opButtons[0] = new Button(100, 305, 50, 50, "AC");
  opButtons[1] = new Button(240, 25, 50, 50, "/");
  opButtons[2] = new Button(240, 95, 50, 50, "X");
  opButtons[3] = new Button(240, 165, 50, 50, "+");
  opButtons[4] = new Button(240, 235, 50, 50, "-");
  opButtons[5] = new Button(240, 305, 50, 50, "=");
  opButtons[6] = new Button(170, 305, 50, 50, ".");
}
void draw() {
  image(background, -550, -300);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
}
void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.equals("0")) {
      dVal = dVal + numButtons[i].val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    } else if (numButtons[i].on) {
      dVal = dVal + numButtons[i].val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val.equals("AC")) {
      //logic for clear button
      dVal = "0";
      op = "0";
      left = true;
      r= 0.0;
      l=0.0;
      result= 0.0;
    } else if (opButtons[i].on && opButtons[i].val.equals("+")) {
      //logic for
      dVal = "0";
      op = "+";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val.equals("-")) {
      //logic for
      dVal = "0";
      op = "-";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val.equals("X")) {
      //logic for
      dVal = "0";
      op = "X";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val.equals("/")) {
      //logic for
      dVal = "0";
      op = "/";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val.equals("=")) {
      //logic for
      performCalculation();
    }
  }
}
void updateDisplay() {
  fill(255);
  rect(30, 25, 200, 50);
  fill(0);
  text(dVal, 31, 50);
}
void performCalculation() {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("/")) {
    result = l / r;
  } else if (op.equals("X")) {
    result = l * r;
  } 
  dVal = str(result);
  l = result;
}
