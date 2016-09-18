PVector mouse = new PVector(0, 0);

boolean mouseDown = false;
boolean mouseUp = true;

Button tester = new Button(50, 50, 200, 80);

void setup() {
  size(600, 600);
  background(255);
  
  tester.buttonFill(100, 100, 100);
  tester.formatText("Arial", 40);
  tester.setText("test", 65, 52);
  tester.textColour(200, 200, 200);
  tester.setOutline(0,0,0,4);
  tester.rounding =  8;
  tester.showHover = true;
  tester.hoverFill(34, 153, 245);
  tester.stateBut = true;
  tester.stateFill(245, 21, 45);
}

void draw() {
  background(255);
  mouse.x = mouseX; mouse.y = mouseY;
  
  hover(tester);
  buttClicked(tester);
  
  tester.show();
  println(tester.released);
}

void mousePressed() {
  mouseDown = true;
  mouseUp = false;
}

void mouseReleased() {
  mouseDown = false;
  mouseUp = true;
}

void hover(Button b) {
    if (inRange(b.x, mouse.x, b.x+b.wid)
    && inRange(b.y, mouse.y, b.y+b.ht)) {
      b.hovered = true;
    } else { b.hovered = false; }
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