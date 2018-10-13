// the grid is a repeating pattern of four 'base' triangles
// start by initializing the arrays to hold each triangle object

Triangle[] triangle1 = new Triangle[250];
Triangle[] triangle2 = new Triangle[250];
Triangle[] triangle3 = new Triangle[250];
Triangle[] triangle4 = new Triangle[250];

// 'a' is the height of the equilateral triangle (with sides of 50 pixels)
float a = sqrt(1875);
float b = a + a;

// k will act as the counter for each triangle object
int k;

void setup() {
  size(13*b, 450);

  // creates a nested loop to redraw the triangles horizontally and then vertically
  for (int i=0; i < 13; i++) {
    for (int j=0; j < 12; j++) {

      k = (i*10) + j;

      // with each loop the triangle is moved twice its height along the x axis
      // and once its height along the y axis. The pattern is repeated for the four
      // 'base' triangles
      float x1 = 0 + (i*b);
      float y1 = 0 + (50*j);
      float x2 = 0 + (i*b);
      float y2 = 50 + (50*j);
      float x3 = a + (i*b);
      float y3 = 25 + (50*j);
      triangle1[k] = new Triangle(x1, y1, x2, y2, x3, y3);

      float d1 = a + (i*b);
      float e1 = -25 + (50*j);
      float d2 = a + (i*b);
      float e2 = 25 + (50*j);
      float d3 = 0 + (i*b);
      float e3 = 0 + (50*j);
      triangle2[k] = new Triangle(d1, e1, d2, e2, d3, e3);

      float f1 = a + (i*b);
      float g1 = 25 + (50*j);
      float f2 = a + (i*b);
      float g2 = -25 + (50*j);
      float f3 = b + (i*b);
      float g3 = 0 + (50*j);
      triangle3[k] = new Triangle(f1, g1, f2, g2,f3, g3);

      float l1 = a + (i*b);
      float m1 = 25 + (50*j);
      float l2 = b + (i*b);
      float m2 = 0 + (50*j);
      float l3 = b + (i*b);
      float m3 = 50 + (50*j);
      triangle4[k] = new Triangle(l1, m1, l2, m2, l3, m3);
    }
  }
}

void draw() {
  for ( int i=0; i < 13; i++) {
    for ( int j=0; j < 12; j++) {
      k = (i*10) + j;

        // this will draw all the triangles created in setup using the display method
        // of each object triangle
        triangle1[k].display();
        triangle2[k].display();
        triangle3[k].display();
        triangle4[k].display();

    }
  }
}

// creates class object which acts as the basis for each triangle
class Triangle {

  color c;
  float xpos1;
  float ypos1;
  float xpos2;
  float ypos2;
  float xpos3;
  float ypos3;

  // constructor function for Triangle class
  Triangle(float tempXpos1, float tempYpos1,  float tempXpos2, float tempYpos2,  float tempXpos3, float tempYpos3) {

      c = 255;
      xpos1 = tempXpos1;
      ypos1 = tempYpos1;
      xpos2 = tempXpos2;
      ypos2 = tempYpos2;
      xpos3 = tempXpos3;
      ypos3 = tempYpos3;

  }

  // display method draws the triangle
  void display() {
    stroke(200);
    fill(c);
    triangle(xpos1, ypos1, xpos2, ypos2, xpos3, ypos3);
  }

  // change-color method (to be passed to mousePressed event)
  void clicked() {
      if (c == 255) {
        c = #FFCC00;
      }
      else if(c == #FFCC00) {
        c = #4db8ff;
      }
      else if (c == #4db8ff) {
        c = #ff3300;
      }
      else if (c == #ff3300) {
        c = 255;
      }
  }

}

// checks coordinates of each triangle, runs click() method if cursor within "a"
// i.e. the triangle height of each corner

void mousePressed() {

  float a = sqrt(1875);
  for ( int i=0; i < 13; i++) {
    for ( int j=0; j < 12; j++) {
      k = (i*10) + j;
      float a1 = dist(triangle1[k].xpos1, triangle1[k].ypos1, mouseX, mouseY);
      float b1 = dist(triangle1[k].xpos2, triangle1[k].ypos2, mouseX, mouseY);
      float c1 = dist(triangle1[k].xpos3, triangle1[k].ypos3, mouseX, mouseY);

      if (a1 <= a && b1 <= a && c1 <= a) {
        triangle1[k].clicked();
      }

      float a2 = dist(triangle2[k].xpos1, triangle2[k].ypos1, mouseX, mouseY);
      float b2 = dist(triangle2[k].xpos2, triangle2[k].ypos2, mouseX, mouseY);
      float c2 = dist(triangle2[k].xpos3, triangle2[k].ypos3, mouseX, mouseY);

      if (a2 <= a && b2 <= a && c2 <= a) {
        triangle2[k].clicked();
      }

      float a3 = dist(triangle3[k].xpos1, triangle3[k].ypos1, mouseX, mouseY);
      float b3 = dist(triangle3[k].xpos2, triangle3[k].ypos2, mouseX, mouseY);
      float c3 = dist(triangle3[k].xpos3, triangle3[k].ypos3, mouseX, mouseY);

      if (a3 <= a && b3 <= a && c3 <= a) {
        triangle3[k].clicked();
      }

      float a4 = dist(triangle4[k].xpos1, triangle4[k].ypos1, mouseX, mouseY);
      float b4 = dist(triangle4[k].xpos2, triangle4[k].ypos2, mouseX, mouseY);
      float c4 = dist(triangle4[k].xpos3, triangle4[k].ypos3, mouseX, mouseY);

      if (a4 <= a && b4 <= a && c4 <= a) {
        triangle4[k].clicked();
      }
    }
  }
}
