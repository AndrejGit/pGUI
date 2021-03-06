PVector mouse = new PVector(0, 0);

boolean mouseDown = false;
boolean mouseUp = true;

Button tester = new Button(50, 50, 200, 80);
CircButton circle = new CircButton(100, 300, 100);
Slider fader = new Slider(50, 450, 200, 20);

void setup() {
  size(600, 600);
  background(255);
  
  tester.buttonFill(100, 100, 100);
  //tester.noFill = true;
  tester.formatText("Arial", 40);
  tester.setText("test", 65, 52);
  tester.showText = true;
  tester.textColour(200, 200, 200);
  tester.setOutline(0,0,0,4);
  tester.rounding =  8;
  tester.showHover = true;
  tester.hoverFill(34, 153, 245, 50);
  tester.hoverStroke(100, 223, 89);
  tester.clickFill(45, 67, 34);
  tester.stateBut = true;
  tester.stateFill(245, 21, 45);
  
  circle.buttonFill(100, 100, 100);
  circle.noFill = true;
  circle.formatText("Arial", 40);
  circle.setText("test", 18, 62);
  circle.showText = true;
  circle.textColour(200, 200, 200);
  circle.setOutline(0,0,0,4);
  circle.showHover = true;
  circle.hoverFill(34, 153, 245, 50);
  circle.hoverStroke(100, 223, 89);
  circle.clickFill(45, 67, 34);
  circle.stateBut = true;
  circle.stateFill(245, 21, 45);
  
  fader.channelFill(40, 40, 40);
  fader.channelStroke(20, 20, 20);
  // would prefer this to be a slider method
  fader.sliderBtn.buttonFill(50,123,200);
  fader.sliderBtn.setOutline(0,0,0,4);
  fader.sliderBtn.clickFill(20,90,130);
}

void draw() {
  background(255);
  mouse.x = mouseX; mouse.y = mouseY;
  
  tester.hover(mouse);
  circle.hover(mouse);
  tester.checkClick(mouseDown, mouseUp);
  circle.checkClick(mouseDown, mouseUp);
  
  tester.show();
  circle.show();
  fader.slide();
  fader.show();
  
  println(fader.sliderValue);
}

void mousePressed() {
  mouseDown = true;
  mouseUp = false;
}

void mouseReleased() {
  mouseDown = false;
  mouseUp = true;
}

boolean inRange(float low, float value, float high) {
  return (value >= low) && (value <= high);
}