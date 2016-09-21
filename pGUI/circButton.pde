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
  
  // Handles drawing and the application of colours
  void show() {
    strokeWeight(lineWeight);
    stroke(stR, stG, stB);
    fill(dR, dG, dB); // default fill
    
    if (state) {
      stroke(ssR, ssG, ssB);
      fill(sR, sG, sB);
    }
     if (noFill) {
      noFill();
    }
    if (hovered && showHover) {
      stroke(shR, shG, shB);
      fill(hR, hG, hB);
    }
    if (clicked) {
      stroke(scR, scG, scB);
      fill(cR, cG, cB);
    }
    if (released && stateBut) {
      state =! state;
    }

    ellipse(x, y, diameter, diameter);
    fill(tR, tG, tB);
    if (showText) {
      text(buttonText, txtX, txtY);
    }
  }
}