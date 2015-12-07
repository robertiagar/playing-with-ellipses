import peasy.*;

ArrayList<Position> positions;
Position newPosition;
int count=0;
int distanceToDrawLines = 500;
PeasyCam cam;

void setup() {
  size(1280, 720, P3D);
  positions = new ArrayList<Position>();
  smooth(8);
  lights();

  //use simplified spheres (will look blockier, but will render faster)
  sphereDetail(5);
  //frameRate(60);
  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(3000);
}

void draw() {  
  background(123);

  if (count<100) {
    float randomX, randomY, randomZ, randomRadius;
    randomX = random(-width, width);
    randomY = random(-height, height);
    randomZ = random(-1000, 1000);
    randomRadius = random(10, 40);
    newPosition = new Position(new PVector(randomX, randomY, randomZ), randomRadius);
    positions.add(newPosition);
    count++;
  }
  
  for (int i=0; i<positions.size()-1; i++) {
    for (int j=i+1; j<positions.size(); j++) {
      Position iPosition = positions.get(i);
      iPosition.DrawSphere();
      Position jPosition = positions.get(j);
      jPosition.DrawSphere();
      float d = iPosition.vector.dist(jPosition.vector);
      if (d<=distanceToDrawLines && d!=0) {
        stroke(255);
        line(iPosition.vector.x, iPosition.vector.y, iPosition.vector.z, jPosition.vector.x, jPosition.vector.y, jPosition.vector.z);
      }
    }
  }
  noFill();
}


void mousePressed() {
}