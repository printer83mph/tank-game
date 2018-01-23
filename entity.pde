ArrayList<Entity> ov;
ArrayList<Entity> fg;
ArrayList<Entity> bg;
ArrayList<ArrayList<Entity>> entsList = new ArrayList<ArrayList<Entity>>();

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
  fill(28, 40, 170);
  for (int i = 0; i < entsList.size(); i++) {
    ArrayList<Entity> ents = entsList.get(i);
    for (int j = ents.size()-1; j >= 0; j--) {
      Entity ent = ents.get(j);
      if (ent.status == "dead") {
        if (ent.deathFrame == -1) {
          ent.deathFrame = frameCount;
        }
      }
      ent.update();
      if (ent.status == "removable") {
        ents.remove(j);
      } else {
        ent.drawShadow();
      }
    }
  }
}

void drawEnts() {
  for (int i = 0; i < entsList.size(); i++) {
    ArrayList<Entity> ents = entsList.get(i);
    for (int j = ents.size()-1; j >= 0; j--) {
      Entity ent = ents.get(j);
      ent.draw();
    }
  }
}