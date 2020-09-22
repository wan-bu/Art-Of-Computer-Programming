import peasy.*;

float x=0.1;
float y=0;
float z=0;
float t = -1*PI;

ArrayList<PVector> points = new ArrayList<PVector>();
PeasyCam cam;
void setup() {
  size(800, 600,P3D);
  colorMode(HSB);
  cam = new PeasyCam(this,500);
}

void draw() {
  background(0);
  t+=0.01;
  x = sin(t)*(exp(cos(t))-2*cos(4*t)-pow(sin(t/12), 5));
  y = cos(t)*(exp(cos(t))-2*cos(4*t)-pow(sin(t/12), 5));
  z = sin(t)*cos(t)*(exp(cos(t))-2*cos(4*t)-pow(sin(t/12), 5));
  PVector point = new PVector(x,y,z);
  point.mult(15);
  points.add(point);
  translate(0,0,-80);
  scale(5);
  stroke(255);
  noFill();
  float hu = 0;
  beginShape();
  for (PVector v : points) {
    stroke(hu, 255, 255);
    vertex(v.x, v.y,v.z);
    hu+=0.1;
    if (hu>255) {
      hu=0;
    }
  }
  endShape();
}
