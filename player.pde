public class Player extends Entity {

  int hp;
  int lastShot = 0;
  int lastHit = 0;
  float scale = 1;
  float angvel = 0;
  float angle = 0;
  float vel = 0;
  float speed = 0.1;
  char[] keys;
  ArrayList<Bullet> myBullets = new ArrayList<Bullet>();

  public Player(float x, float y, int h, char[] k) {
    super(x, y);
    hp = 5;
    hue = h;
    keys = k;
    radius = 15;
  }

  void update() {
    if (status == "active") {
      vel += speed;
      if (keysPressed.contains(keys[0])) {
        vel += speed;
      } 
      if (keysPressed.contains(keys[1])) {
        vel *= 0.6;
      } 
      if (keysPressed.contains(keys[2])) {
        angvel -= 0.012;
      } 
      if (keysPressed.contains(keys[3])) {
        angvel += 0.012;
      }
      angle += angvel;
      angvel *= 0.82;
      pos.add(PVector.fromAngle(angle).mult(vel));
      if (pos.x > width - 20) {
        pos.x = width - 20;
      } else if (pos.x < 20) {
        pos.x = 20;
      } 
      if (pos.y > height - 20) {
        pos.y = height - 20;
      } else if (pos.y < 20) {
        pos.y = 20;
      }
      vel *= 0.95;
  
      if (abs(vel) > 2.5) {
        if (frameCount % 7 == 0) {
          bg.add(new Smoke(pos.x, pos.y, hue));
        }
      } else {
        if (frameCount - lastShot >= 30 + vel*10) {
          PVector bulletStart = PVector.add(pos, PVector.fromAngle(angle).mult(25));
          fg.add(new Bullet(bulletStart.x, bulletStart.y, angle, vel*2+4, hue));
          lastShot = frameCount;
        }
      }
    } else if (status == "dead") {
      scale -= 0.05/scale;
      if (scale < 0.1) {
        status = "removable";
      }
    }
  }

  void hit() {
    if (frameCount-lastHit > 20) {
      hp--;
      if (hp <= 0) {
        status = "dead";
      };
      lastHit = frameCount;
    }
  }

  void slowDown() {
    vel *= 0.6;
  }

  void drawShadow() {
    pushMatrix();
    translate(pos.x+4, pos.y+4);
    rotate(angle);
    scale(scale);
    rect(-20, -14, 40, 28);
    rect(-4, -3, 30, 6);
    popMatrix();
  }

  void draw() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    scale(scale);
    fill(hue, 230, 200);
    rect(-20, -14, 40, 28);
    fill(hue, 255, 255);
    rect(-14, -10, 28, 20);
    fill(hue, 245, 230);
    rect(-4, -3, 30, 6);
    popMatrix();
  }
}