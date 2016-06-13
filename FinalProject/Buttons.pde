PShape square;  // The PShape object
PImage buttons;

void drawButton() {
  //set up square shapes
  /*square = createShape(RECT, 0, 0, 125, 80);
  square.setFill(color(0, 0, 255));
  square.setStroke(false);
  shape(square, 100, 300); */
  buttons = loadImage("OldMaidIcon.jpg");
  image(buttons, 100,300);
  buttons = loadImage("BlackJackIcon.jpg");
  image(buttons, 400,300);
  buttons = loadImage("BSIcon.jpg");
  image(buttons, 100,180);
  buttons = loadImage("WarIcon.jpg");
  image(buttons, 400,180);
}