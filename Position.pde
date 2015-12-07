import java.util.Map;

public class Position {
  public PVector vector;
  public float radius;

  public Position(PVector vector, float radius) {
    this.vector = vector;
    this.radius = radius;
  }

  public void DrawSphere() {
    noStroke();
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