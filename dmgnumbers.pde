public class DamageNumber extends Entity {
  
  int number;
  
  public DamageNumber(float x, float y, int num) {
    super(x,y);
    number = num;
  }
  
  void update() {
    if (status == "active") {
      if (frameCount-startFrame == 60) {
        status = "removable";
      }
    }
  }
  
  void draw() {
    fill(255);
    textSize(sin(radians((float)(frameCount-startFrame+1))*2.9)*30);
    text(number, pos.x, pos.y - frameCount + startFrame);
  }
  
  void drawShadow() {
    text(number, pos.x + 3, pos.y - frameCount + startFrame + 3);
  }
}