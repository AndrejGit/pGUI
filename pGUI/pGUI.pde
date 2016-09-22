PVector mouse = new PVector(0, 0);

boolean mouseDown = false;
boolean mouseUp = true;

Button tester = new Button(50, 50, 200, 80);
CircButton circle = new CircButton(100, 300, 100);

void setup() {
  size(600, 600);
  background(255);
  
  tester.buttonFill(100, 100, 100);
  tester.noFill = true;
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
}

void draw() {
  background(255);
  mouse.x = mouseX; mouse.y = mouseY;
  
  tester.hover(mouse);
  circle.hover(mouse);
  buttClicked(tester);
  buttClicked(circle);
  
  tester.show();
  circle.show();
}

void mousePressed() {
  mouseDown = true;
  mouseUp = false;
}

void mouseReleased() {
  mouseDown = false;
  mouseUp = true;
}
  
void buttClicked(Button b) {
    if (b.hovered && mouseDown) {
      b.clicked = true;
    }
    if (b.hovered && mouseUp && b.clicked) {
      b.released = true;
      b.clicked = false;
    } else { b.released = false; }
}

boolean inRange(float low, float value, float high) {
  return (value >= low) && (value <= high);
}