
Player ply, ply2;

void setup() {
  size(800, 800);
  smooth();
  noStroke();
  colorMode(HSB, 255);
  entsList.add(new ArrayList<Entity>());
  entsList.add(new ArrayList<Entity>());
  entsList.add(new ArrayList<Entity>());
  ov = entsList.get(2);
  fg = entsList.get(1);
  bg = entsList.get(0);
  char[] plykeys = {'w', 's', 'a', 'd','x'};
  fg.add(new Player(400, 600, 0, plykeys));
  char[] ply2keys = {'i', 'k', 'j', 'l','m'};
  fg.add(new Player(400, 200, 150, ply2keys));
}

void draw() {
  background(120, 60, 60);
  runEnts();
  fill(120, 60, 60, 200);
  rect(0, 0, width, height);
  drawEnts();
}