PVector p, vel;
float sze=5, t, angle;
int lineCount=3,sw=4;
void setup() {
  size(500, 500);
  p=new PVector(width/2, height/2);
  vel=new PVector(0, 0);
  strokeWeight(sw);
  background(255);
}
void draw() {
  angle=map(noise(t), 0, 1, 90, 270);
  vel.set(cos(radians(angle)), sin(radians(angle)));
  p.add(vel);
  PVector v= vel.copy().setMag(sw);
  PVector left=v.copy().rotate(PI/2);
  PVector right=v.copy().rotate(-PI/2);
  //center line
  point(p.x, p.y);
  for (int i=0; i<lineCount*2; i++) {
    if (i%2==0) {
      stroke(0);
    } else {
      stroke(255);
    }
    point(p.x-right.x*i, p.y-right.y*i);
    point(p.x-left.x*i, p.y-left.y*i);
  }
  t+=0.0085;
  checkBound(p);
}
void checkBound(PVector vector) {
  int tolerance=15;
  if (vector.x>width+tolerance) {
    vector.x=-tolerance;
  }
  if (vector.x<-tolerance) {
    vector.x=width+tolerance;
  }
  if (vector.y>height+tolerance) {
    vector.y=-tolerance;
  }
  if (vector.y<-tolerance) {
    vector.y=height+tolerance;
  }
}
