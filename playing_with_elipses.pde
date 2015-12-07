import peasy.*;

ArrayList<Position> positions;
Position newPosition;
int count=0;
int distanceToDrawLines = 500;
int speed = 3;
PeasyCam cam;

void setup() {
  size(1280, 720, P3D);
  positions = new ArrayList<Position>();
  smooth(8);
  lights();

  //use simplified spheres (will look blockier, but will render faster)
  sphereDetail(5);
  frameRate(60);
  cam = new PeasyCam(this, 3500);
  cam.setMinimumDistance(0);
  cam.setMaximumDistance(6000);
}

void draw() {  
  if (speed <= 0)
    speed =3;
  background(0);
  while (count<1000) {
    float randomX, randomY, randomZ, randomRadius;
    randomX = random(-width*2, width*2);
    randomY = random(-height*2, height*2);
    randomZ = random(-1000*2, 1000*2);
    randomRadius = random(10, 40);
    newPosition = new Position(new PVector(randomX, randomY, randomZ), randomRadius);
    positions.add(newPosition);
    count++;
    println(count);
  }

  for (int i=0; i<positions.size()-1; i++) {
    for (int j=i+1; j<positions.size(); j++) {
      Position iPosition = positions.get(i);
      iPosition.DrawSphere();
      Position jPosition = positions.get(j);
      jPosition.DrawSphere();
      //cam.lookAt(iPosition.vector.x, iPosition.vector.y, iPosition.vector.z, 5);
      float d = iPosition.vector.dist(jPosition.vector);
      if (d<=distanceToDrawLines && d!=0 || d<=distanceToDrawLines + 50) {
        stroke(255);
        line(iPosition.vector.x, iPosition.vector.y, iPosition.vector.z, jPosition.vector.x, jPosition.vector.y, jPosition.vector.z);
      }
    }
  }


  noFill();
  saveFrame("/output3/sequence####.tga");
}


void mousePressed() {
}