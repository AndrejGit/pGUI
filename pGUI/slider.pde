class Slider {
  float x, y;
  float wid, ht;
  float sliderPos;
  Button sliderBtn;
  
  float sliderValue = 0;
  
  int chR, chG, chB;
  int scR, scG, scB;
  
  Slider(float sx, float sy, float w, float h) {
    x = sx;
    y = sy;
    wid = w;
    ht = h;
    
    sliderPos = sx;
    sliderBtn = new CircButton(sliderPos, y+(ht/2), ht+20);
  }
  
  void channelFill(int r, int g, int b) {
    chR = r; chG = g; chB = b;
  }
  
  void channelStroke(int r, int g, int b) {
    scR = r; scG = g; scB = b;
  }
  
  void squareSlider() {
    sliderBtn = new Button(sliderPos, y, ht+10, ht+10);
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
      if (inRange(x, mouse.x, x+wid)) {
        sliderBtn.x = mouse.x;
        sliderValue = map(mouse.x, x, x+wid, 0, 1);
      }
    } else { sliderBtn.x = sliderBtn.x; }
    
    // If you click on the channel move the button to it
    if (chnlHover(mouse) && mouseDown) {
      sliderBtn.x = mouse.x;
    } else { sliderBtn.x = sliderBtn.x; }
  }
  
  void show() {
    fill(chR, chG, chB);
    stroke(scR, scG, scB);
    rect(x, y, wid, ht); // slider channel
    sliderBtn.show();
  }
}