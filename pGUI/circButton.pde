class CircButton {
  
  float x, y;
  float radius;
  
  boolean hovered = false;
  
  CircButton(float cx, float cy, float rad) {
    x = cx;
    y = cy;
    radius = rad;
  }
  
  void show() {
    ellipse(x, y, radius, radius);
  }
}