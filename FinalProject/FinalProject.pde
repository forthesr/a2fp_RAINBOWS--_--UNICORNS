//art stuff
PImage background;

//game stuff
boolean ingame;
int wins;
int losses;
boolean winner;
boolean loser;

 
void setup(){
  size(600,400);
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
  

void startGame(int game){
  if (game == 1){
     background = loadImage("OldMaidStartScreen.jpg");
       image(background, 0, 0);
   }

}

 