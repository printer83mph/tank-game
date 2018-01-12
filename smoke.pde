public class Smoke extends Entity {

  PVector point1;
  PVector point2;
  PVector point3;
  
  public Smoke(float x, float y, int h) {
    super(x, y);
    radius = 1;
    status = "spawning";
    deathFrame = frameCount;
    hue = h;
    point1 = new PVector(pos.x+random(-5, 6), pos.y+random(-5, 6));
    point2 = new PVector(pos.x+random(-5, 6), pos.y+random(-5, 6));
    point3 = new PVector(pos.x+random(-5, 6), pos.y+random(-5, 6));
  }

  void update() {
    if (status == "spawning") {
      radius += 3/radius;
      if (frameCount - deathFrame == 10) {
        status = "dead";
      }
    } else if (status == "dead") {
      radius--;
      if (radius <= 0) {
        status = "removable";
      }
    }
  }

  void draw() {
    fill(hue,100,250-frameCount/2 + deathFrame/2);
    ellipse(point1.x, point1.y, radius*2, radius*2);
    ellipse(point2.x, point2.y, radius*2, radius*2);
    ellipse(point3.x, point3.y, radius*2, radius*2);
  }

  void drawShadow() {
    pushMatrix();
    translate(3,3);
    ellipse(point1.x, point1.y, radius*2, radius*2);
    ellipse(point2.x, point2.y, radius*2, radius*2);
    ellipse(point3.x, point3.y, radius*2, radius*2);
    popMatrix();
  }
}