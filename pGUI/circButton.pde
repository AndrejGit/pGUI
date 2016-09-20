class CircButton {
  
  float x, y;
  float diameter;
  
  PFont buttonFont;
  String buttonText;
  float txtX, txtY;
  
  boolean hovered = false;
  boolean showHover = false;
  boolean clicked = false;
  boolean released = false;
  boolean stateBut = false;
  boolean state = false;
  boolean showText = false;
  
  int dR, dG, dB;
  int hR, hG, hB;
  int cR, cG, cB;
  int sR, sG, sB;
  int tR, tG, tB;
  int stR, stG, stB;
  int shR, shG, shB;
  int scR, scG, scB;
  int ssR, ssG, ssB;
  float lineWeight = 1;
  boolean noFill = false;
  
  CircButton(float cx, float cy, float diam) {
    x = cx;
    y = cy;
    diameter = diam;
    
    buttonText = " ";
  }
  
  /* SETUP/FORMATTING FUNCTIONS */
  
  void formatText(String font, int size) {
    buttonFont = createFont(font, size);
    textFont(buttonFont);
  }
  
  void setText(String text, float tx, float ty) {
    buttonText = text;
    txtX = tx + (x - diameter/2);
    txtY = ty + (y - diameter/2);
  }
  
  void textColour(int R, int G, int B) {
    tR = R; tG = G; tB = B;
  }
  
  void buttonFill(int R, int G, int B) {
    dR = R; dG = G; dB = B;
  }
  
  void hoverFill(int R, int G, int B) {
    hR = R; hG = G; hB = B;
  }
  
  void clickFill(int R, int G, int B) {
    cR = R; cG = G; cB = B;
  }
  
  void stateFill(int R, int G, int B) {
    sR = R; sG = G; sB = B;
  }
  
  void setOutline(int R, int G, int B, float w) {
    lineWeight = w;
    stR = R; stG = G; stB = B;
  }
  
  void hoverStroke(int R, int G, int B) {
    shR = R; shG = G; shB = B;
  }
  
  void clickStroke(int R, int G, int B) {
    scR = R; scG = G; scB = B;
  }
  
  void stateStroke(int R, int G, int B) {
    ssR = R; ssG = G; ssB = B;
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