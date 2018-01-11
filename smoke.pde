ArrayList<Smoke> smokes = new ArrayList<Smoke>();

public class Smoke extends Entity {

  public Smoke(float x, float y, int h) {
    super(x, y);
    radius = 1;
    status = "spawning";
    deathFrame = frameCount;
    hue = h;
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
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  void drawShadow() {
    fill(0);
    ellipse(pos.x, pos.y, radius*2+10, radius*2+10);
  }
}

void runSmoke() {
  for (int i = smokes.size()-1; i >= 0; i--) {
    Smoke smoke = smokes.get(i);
    smoke.update();
    if (smoke.status == "removable") {
      smokes.remove(i);
    } else {
      smoke.drawShadow();
    }
  }
}

void drawSmoke() {
  for (int i = 0; i < smokes.size(); i++) {
    Smoke smoke = smokes.get(i);
    smoke.draw();
  }
}