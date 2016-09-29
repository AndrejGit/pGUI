class Slider {
  float x, y;
  float wid, ht;
  float sliderPos;
  Button sliderBtn;
  
  float sliderValue = 0;
  
  int chR, chG, chB;
  int scR, scG, scB;
  
  boolean verticalSlider = false;
  
  Slider(float sx, float sy, float w, float h) {
    x = sx;
    y = sy;
    wid = w;
    ht = h;
    
    if (ht > wid) {
      verticalSlider = true;
      sliderPos = sy;
      sliderBtn = new CircButton(x+(wid/2), sliderPos, wid+20);
    } else {
      sliderPos = sx;
      sliderBtn = new CircButton(sliderPos, y+(ht/2), ht+20);
    }
  }
  
  void channelFill(int r, int g, int b) {
    chR = r; chG = g; chB = b;
  }
  
  void channelStroke(int r, int g, int b) {
    scR = r; scG = g; scB = b;
  }
  
  void squareSlider() { // buggy
    if (!verticalSlider) {
      sliderBtn = new Button(sliderPos, y, ht+10, ht+10);
    } else {
      sliderBtn = new Button(x, sliderPos, wid+10, wid+10);
    }
  }
  
  boolean chnlHover(PVector m) {
    if (inRange(x, m.x, x+wid)
    && inRange(y, m.y, y+ht)) {
      return true;
    } else { return false; }
  }
  
  void slide() {
    // If you want to slide you need thse functions running
    sliderBtn.hover(mouse);
    sliderBtn.checkClick(mouseDown, mouseUp);
    
    if (sliderBtn.clicked) {
      if (!verticalSlider) {
        if (inRange(x, mouse.x, x+wid)) {
          sliderBtn.x = mouse.x;
          sliderValue = map(mouse.x, x, x+wid, 0, 1);
        }
      } else {
        if (inRange(y, mouse.y, y+ht)) {
          sliderBtn.y = mouse.y;
          sliderValue = map(mouse.y, y, y+ht, 0, 1);
        }
      }
    } else { // You've released the mouse  
      if (!verticalSlider) {
        sliderBtn.x = sliderBtn.x;
      } else { sliderBtn.y = sliderBtn.y; } 
    }
    
    // If you click on the channel move the button to it
    if (chnlHover(mouse) && mouseDown) {
      if (!verticalSlider) {
        sliderBtn.x = mouse.x;
      } else { sliderBtn.y = mouse.y; }
    } else { 
      if (!verticalSlider) {
        sliderBtn.x = sliderBtn.x;
      } else { sliderBtn.y = sliderBtn.y; } 
    }
  }
  
  void show() {
    fill(chR, chG, chB);
    stroke(scR, scG, scB);
    rect(x, y, wid, ht); // slider channel
    sliderBtn.show();
  }
}