import java.util.Map;

public class Position {
  public PVector vector;
  private boolean drawn;
  public float radius;

  public Position(PVector vector, float radius) {
    this.vector = vector;
    this.radius = radius;
  }

  public void DrawSphere() {
    if (!drawn) {
      fill(255, 0, 0, 75);
      noStroke();
      translate(vector.x, vector.y, vector.z);
      sphere(radius);
      fill(0);
      stroke(0);
      drawn = true;
    }
  }

  public void DrawEllipse() {
    if (!drawn) {
      fill(random(0,255), random(0,255), random(0,255), 75);
      noStroke();
      ellipse(vector.x, vector.y, radius, radius);
      point(vector.x, vector.y);
      fill(0);
      drawn = true;
    }
  }
}