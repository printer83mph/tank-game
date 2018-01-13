public class Bullet extends Entity {

  float angle;
  float speed;

  public Bullet(float x, float y, float a, float s, int h) {
    super(x, y);
    speed = s;
    angle = a;
    hue = h;
    radius = 5;
  }

  void update() {
    if (status == "active") {
      pos.add(PVector.fromAngle(angle).mult(speed));
      if (frameCount-startFrame == 45) {
        hit();
      }
      for (int i = 0; i < fg.size(); i++) {
        Entity ent = fg.get(i);
        if (hue != ent.hue) {
          if (pos.dist(ent.pos) < ent.radius + radius) {
            hit();
            ent.hit();
            break;
          }
        }
      }
    } else if (status == "dead") {
      radius = sin((float)(frameCount-deathFrame)/10)*50;
      if (frameCount-deathFrame == 30) {
        status = "removable";
      }
      for (int i = 0; i < fg.size(); i++) {
        Entity ent = fg.get(i);
        if (hue != ent.hue) {
          if (pos.dist(ent.pos) < ent.radius + radius) {
            ent.hit();
          }
        }
      }
    }
  }

  void draw() {
    fill(hue, 255, 255);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }

  void drawShadow() {
    ellipse(pos.x+3, pos.y+3, radius*2, radius*2);
  }

  void hit() {
    status = "dead";
    if (deathFrame == -1) {
      deathFrame = frameCount;
    }
  }
}