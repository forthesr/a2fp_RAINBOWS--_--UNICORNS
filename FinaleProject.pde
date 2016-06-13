//art stuff
PImage background;
float m = millis(); 
PImage cardback; //= loadImage("CardBack.jpg");


//game stuff
boolean ingame;
int wins;
int losses;
boolean winner;
boolean loser;

 
void setup(){
  size(600,400);
  cardback = loadImage("CardBack.jpg");
}
 
void draw(){
  background(240);
  startScreen();
  drawButton();
}
 
void startScreen(){
    background(115,201,47);
    textSize(50);
    fill(0);
    text("Welcome to the",100,100);
    text("Card Arcade", 120,150);
  }

  
void mousePressed() {
  if(mouseX > 100 && mouseX < 200 &&
    mouseY > 300 && mouseY < 400) {
      startGame(1);} }



void startGame(int game){
  if (game == 1){
     background = loadImage("OldMaidStartScreen.jpg");
       image(background, 0, 0);
       playOldMaid();
   } }