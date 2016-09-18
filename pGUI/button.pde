class Button {
  
  float x, y;
  float wid, ht;
  
  PFont buttonFont;
  String buttonText;
  float txtX, txtY;
  
  boolean hoverBut = false;
  boolean hovered = false;
  boolean showHover = false;
  boolean clicked = false;
  boolean released = false;
  boolean stateBut = false;
  boolean state = false;
  
  int dR, dG, dB;
  int hR, hG, hB;
  int cR, cG, cB;
  int sR, sG, sB;
  int tR, tG, tB;
  int stR, stG, stB;
  float lineWeight = 1;
  
  int rounding = 0;
  
  Button(float bx, float by, float w, float h) {
    x = bx;
    y = by;
    wid = w;
    ht = h;    
  }
  
  /* SETUP/FORMATTING FUNCTIONS */
  
  void formatText(String font, int size) {
    buttonFont = createFont(font, size);
    textFont(buttonFont);
  }
  
  void setText(String text, float tx, float ty) {
    buttonText = text;
    txtX = tx + x;
    txtY = ty + y;
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
  
  
  // Handles drawing and the application of colours
  void show() {
    strokeWeight(lineWeight);
    stroke(stR, stG, stB);
    fill(dR, dG, dB); // default fill
    
     if (state) {
      fill(sR, sG, sB);
    }
    if (hovered && showHover) {
      fill(hR, hG, hB);
    }
    if (clicked) {
      fill(cR, cG, cB);
    }
    if (released && stateBut) {
      state =! state;
    }
    rect(x, y, wid, ht, rounding);
    fill(tR, tG, tB);
    text(buttonText, txtX, txtY);
  }
}

/* 
- Outline colour
- outline thickness
- round corners
- hover appearance
*/