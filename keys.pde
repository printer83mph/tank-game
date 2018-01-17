ArrayList<Character> keysPressed = new ArrayList<Character>();

void keyPressed() {
  keysPressed.add(key);
  if (key == 'r') {
    reset();
  }
}

void keyReleased() {
  int i = keysPressed.size()-1;
  while (i >= 0) {
    if (keysPressed.get(i) == key) {
      keysPressed.remove(i);
    }
    i--;
  }
}