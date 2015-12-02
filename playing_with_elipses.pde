import peasy.*;
import ddf.minim.*;
import ddf.minim.analysis.*;

ArrayList<Position> positions;
int count=0;
Minim minim;
BeatDetect beat;
AudioInput input;
int distanceToDrawLines = 30;
PeasyCam cam;

void setup() {
  size(1280, 720, P2D);
  stroke(255);
  positions = new ArrayList<Position>();
  smooth(8);
  frameRate(60);
  minim = new Minim(this);
  beat = new BeatDetect();
  input = minim.getLineIn(Minim.STEREO);
  //lights();

  cam = new PeasyCam(this, 100);
  cam.setMinimumDistance(width);
  cam.setMaximumDistance(height);
}

void draw() {  
  beat.detect(input.mix);
  float randomX, randomY, randomZ, randomRadius;
  randomX = random(0, width);
  randomY = random(0, height);
  randomZ = random(0, 40);
  randomRadius = random(30, 60);

  Position newPosition = new Position(new PVector(randomX, randomY), 35);
  positions.add(newPosition);
  fill(255, 0, 0, 75);
  stroke(0);

  for (int i=0; i<positions.size(); i++) {
    Position position = positions.get(i);
    if (position!=newPosition) {
      float d = dist(position.vector.x, position.vector.y, newPosition.vector.x, newPosition.vector.y);

      if (d<=distanceToDrawLines && d!=0) {
        println(d, positions.size(), position.vector, newPosition.vector);
        stroke(0.05);
        noFill();
        strokeWeight(0.25);
        line(position.vector.x, position.vector.y, newPosition.vector.x, newPosition.vector.y);
      }
    }
  }

  newPosition.DrawEllipse();
}

void mousePressed() {
}