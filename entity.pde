ArrayList<Entity> ents = new ArrayList<Entity>();

public class Entity {
  
  int startFrame;
  String status = "active";
  int deathFrame = -1;
  int hue;
  float radius = 0;
  PVector pos;
  float speed = 0;
  
  public Entity(float x, float y) {
    startFrame = frameCount;
    pos = new PVector(x,y);
  }
  
  void update() {}
  
  void draw() {}
  
  void drawShadow() {}
  
  void hit() {}
  
  void slowDown() {}
  
}

void runEnts() {
  fill(0);
  for (int i = ents.size()-1; i >= 0; i--) {
    Entity ent = ents.get(i);
    if (ent.status == "dead") {
      if (ent.deathFrame == -1) {
        ent.deathFrame = frameCount;
      }
    }
    ent.update();
    if (ent.status == "removable") {
      ents.remove(i);
    } else {
      ent.drawShadow();
    }
  }
}

void drawEnts() {
  for (int i = ents.size()-1; i >= 0; i--) {
    Entity ent = ents.get(i);
    ent.draw();
  }
}