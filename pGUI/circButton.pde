class CircButton extends Button {
  
  float diameter;
  
  CircButton(float cx, float cy, float diam) {
    super(cx, cy, diam, diam);
    diameter = diam;
  }
  
  // Subclass methods overriding superclass methods
  void setText(String text, float tx, float ty) {
    buttonText = text;
    txtX = tx + (x - diameter/2);
    txtY = ty + (y - diameter/2);
  }
  
  void hover(PVector m) {
    float d = dist(x, y, m.x, m.y);
    if (d <= (diameter/2)) {
      hovered = true;
    } else { hovered = false; }
  }
  
  void drawShape() {
    ellipse(x, y, diameter, diameter);
  }
}