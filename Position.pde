import java.util.Map;

public class Position {
  private float speed;
  public PVector vector;
  public float radius;

  public Position(PVector vector, float radius) {
    this.vector = vector;
    this.radius = radius;
    this.speed = 0.05;
  }

  public void DrawSphere() {
    noStroke();
    vector.x+=random(-speed, speed);
    vector.y+=random(-speed, speed);
    vector.z+=random(-speed, speed);
    fill(200, 0, 0, 75);
    pushMatrix();
    translate(vector.x, vector.y, vector.z);

    sphere(radius);
    popMatrix();
  }

  public void DrawEllipse() {
    pushMatrix();
    translate(vector.x, vector.y, vector.z);
    ellipse(vector.x, vector.y, radius, radius);
    popMatrix();
  }
}