Triangle triangle1;
Triangle triangle2;
Triangle triangle3;
Triangle triangle4;

// height of equilateral triangle with side length of 50
float a = sqrt(1875);

float b = a + a;
// int c = 0;

void setup() {
  size(10*b, 600);

  // created four initial triangles, two pointing left, two right
  // this is likely not necessary (rotate or translate could have been used)
  triangle1 = new Triangle(0, 0, 0, 50, a, 25);
  triangle2 = new Triangle(a, -25, a, 25, 0, 0);
  triangle3 = new Triangle(a, 25, a, -25, b, 0);
  triangle4 = new Triangle(a, 25, b, 0, b, 50);

}

void mousePressed() {

  // the 'clicked' function from the Triangle class is called when the mouse is pressed
  for ( int i=0; i<10; i++) {
    for ( int j=0; j<13; j++) {
      triangle1.clicked();
      triangle2.clicked();
      triangle3.clicked();
      triangle4.clicked();
    }
  }
}

void draw() {
  for ( int i=0; i<10; i++) {
    for ( int j=0; j<13; j++) {

      // translates the four initial triangles from setup to create the background pattern
      pushMatrix();
      translate(b*i, 50*j);
      triangle1.display();
      triangle2.display();
      triangle3.display();
      triangle4.display();
      popMatrix();
    }
  }
}

class Triangle {

  int c;
  float xpos1;
  float ypos1;
  float xpos2;
  float ypos2;
  float xpos3;
  float ypos3;

  // constructor function for Triangle class
  Triangle(float tempXpos1, float tempYpos1,  float tempXpos2, float tempYpos2,  float tempXpos3, float tempYpos3) {

      c = 155;
      xpos1 = tempXpos1;
      ypos1 = tempYpos1;
      xpos2 = tempXpos2;
      ypos2 = tempYpos2;
      xpos3 = tempXpos3;
      ypos3 = tempYpos3;

  }

  // display class function draws the triangle
  void display() {
    stroke(#e6f9ff);
    fill(c);
    triangle(xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);
  }

  // change-color function (to be passed to mousePressed event)
  void clicked() {
    if(c == 155) {
      c = 0;
    }
    else if (c == 0) {
      c = 255;
    }
    else if (c == 255) {
      c = 155;
    }
  }
}

// incomplete test to see if cursor is inside triangle (to be placed in 'click' function):
//  if (mouseX - xpos1 < 50) { ... }
