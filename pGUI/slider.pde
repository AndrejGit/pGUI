class Slider {
  float x, y;
  float wid, ht;
  float sliderPos;
  Button sliderBtn;
  
  int chR, chG, chB;
  int scR, scG, scB;
  
  Slider(float sx, float sy, float w, float h) {
    x = sx;
    y = sy;
    wid = w;
    ht = h;
    
    sliderPos = sx;
    sliderBtn = new CircButton(sliderPos, (ht-y)/2, ht+10);
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
  
  void slide() {
  }
  
  void show() {
    fill(chR, chG, chB);
    stroke(scR, scG, scB);
    rect(x, y, wid, ht); // slider channel
  }
}