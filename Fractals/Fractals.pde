import peasy.*;
float rot=-PI;
PeasyCam cam;
int hu=100;
int limit=1;
int maxIteration=5;
String count="iteration = "+limit;
PFont font;

ArrayList<ArrayList<PVector>> triangles = new ArrayList();

void setup() {
  size(800, 600,P3D);
  colorMode(HSB);
  cam = new PeasyCam(this,1000);
  font = createFont("Algerian", 79, true);
  textFont(font);
}

void draw() {
  background(0);
  init();
  rot+=0.01;
  rotateY(rot);
  translate(0,0,-80);
  pushMatrix();
  fill(255,108,219);
  text(count,-250,-300,0);
  popMatrix();
  pushMatrix();
  fill(255,108,219);
  text("sierpinski triangle",-370,300,0);
  popMatrix();
  drawTriangles();

}

void init(){
  PVector pointA=new PVector(0,-200,10),
  pointB=new PVector(200,100,20),
  pointC=new PVector(-200,100,-10);
  sierpinski(pointA,pointB,pointC,limit);
}

void sierpinski(PVector pointA,PVector pointB,PVector pointC,int limit){
  PVector a=new PVector((pointA.x+pointB.x)/2,(pointA.y+pointB.y)/2,(pointA.z+pointB.z)/2),
  b=new PVector((pointB.x+pointC.x)/2,(pointB.y+pointC.y)/2,(pointB.z+pointC.z)/2),
  c=new PVector((pointC.x+pointA.x)/2,(pointC.y+pointA.y)/2,(pointC.z+pointA.z)/2);
  if(limit>0){
     sierpinski(pointA,a,c,limit-1);
     sierpinski(a,pointB,b,limit-1);
     sierpinski(c,b,pointC,limit-1);
  }
  drawTriangle(pointA,a,c);
  drawTriangle(a,pointB,b);
  drawTriangle(c,b,pointC);
  
}

void drawTriangle(PVector pointA,PVector pointB,PVector pointC){
  ArrayList<PVector> pointsArray = new ArrayList();
  pointsArray.add(pointA);
  pointsArray.add(pointB);
  pointsArray.add(pointC);
  triangles.add(pointsArray);
}

void drawTriangles(){
  beginShape();
  for(ArrayList<PVector> triangle:triangles){
    triangle(triangle.get(0).x,triangle.get(0).y,triangle.get(1).x,triangle.get(1).y,triangle.get(2).x,triangle.get(2).y);
    stroke(hu, 255, 255); 
    fill(0);
    hu+=5;
    if (hu>255) {
      hu=0;
    }
  }
  strokeWeight(2);
  endShape();
}

void mousePressed() {
  cursor(HAND);
   if(limit==maxIteration){
     limit=1;
     triangles=new ArrayList();
   }else{
     limit++;
   }
   count="iteration = "+limit;
}
