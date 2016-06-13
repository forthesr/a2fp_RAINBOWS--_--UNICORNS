//art stuff
PImage background;
float m = millis(); 
PImage cardback; //= loadImage("CardBack.jpg");
boolean click;
int game;

//game stuff
boolean ingame;
int wins;
int losses;
boolean winner;
boolean loser;

  void mouseClicked(){
    click = true;
  }
 
void setup(){
  size(600,400);
  cardback = loadImage("CardBack.jpg");
}
 
void draw(){
  background = loadImage("InGameScreen.jpg");
  image(background,0,0);
  if (click){
  background(240);
  startScreen();
  drawButton();
  mousePressed(); }
  }
 
void startScreen(){
    background(115,201,47);
    textSize(50);
    fill(0);
    text("Welcome to the",100,100);
    text("Card Arcade", 120,150);
  }

  
void mousePressed() {
  if(mouseX > 50 && mouseX < 300 &&
    mouseY > 180 && mouseY < 400) {
      game = 1;
      startGame(1);}
      if(mouseX > 300 && mouseX < 500 &&
    mouseY > 180 && mouseY < 400){
    game = 2;
  startGame(2);}
  }



void startGame(int game){
  if (game == 1){
     background = loadImage("OldMaidStartScreen.jpg");
       image(background, 0, 0);
       playOldMaid();
   }
   if (game == 2){
     background = loadImage("WARStartScreen.jpg");
     image(background,0,0);
     War();
     playWar();
   }
 
 }