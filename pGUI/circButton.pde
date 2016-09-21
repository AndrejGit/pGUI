class CircButton extends Button {
  
  float diameter;
  
  CircButton(float cx, float cy, float diam) {
    super(cx, cy, diam, diam);
    diameter = diam;
  }
  
  /* SETUP/FORMATTING FUNCTIONS */
  
  void setText(String text, float tx, float ty) {
    buttonText = text;
    txtX = tx + (x - diameter/2);
    txtY = ty + (y - diameter/2);
  }
  
  // INTERACTION
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