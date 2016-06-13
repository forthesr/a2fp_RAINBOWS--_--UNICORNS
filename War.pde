    Deck _winPile;
    Deck _p1Play;
    Deck _p2Play;
    Deck _p1Win;
    Deck _p2Win;
    boolean fin;
    
    void War(){
      
    fin = false;

    //needed for case when same card played
     _winPile = new Deck();

    //p1 is player, p2 is cpu
    
    //players' hands 
    _p1Play = new Deck();
    _p2Play = new Deck();

    //players' win piles
    _p1Win = new Deck();
    _p2Win = new Deck();
    
  Deck blah = new Deck(52);
  blah.shuffle();

  System.out.println("Starting game");
  System.out.println("Shuffling cards");

  System.out.println("Distributing cards");
  //splits the deck
  for (int i = 0; i < 52; i+= 2){
      _p1Play.drawFrom(blah, 0);
      _p2Play.drawFrom(blah, 0);
  }

  //helper SOP statement
  //System.out.println("P1: " + _p1Play + "\nP2: " + _p2Play);
    }
    
    
    void swapDeck(Deck win, Deck play){
  while (win.getSize() > 0)
        play.drawFrom(win, 0);
        play.shuffle();
    }

     void winGame() {
    background = loadImage("YouLose.jpg");
    image(background,0,0);
    System.out.println("YAY!! You win!!");
    fin = true;
    }
   
     void loseGame() {
      background = loadImage("YouLose.jpg");
      image(background,0,0);
       System.out.println("You dumb loser.");
      fin = true;
    }
    
    public void playWar(){
  //winner of round
  Deck temp = _p1Play;
  //if player hand empty
  if (_p1Play.isEmpty()){
      //if win also empty, game lost
      if (_p1Win.isEmpty()){
    loseGame();
      }
      //if not, puts win in play, shuffles
      else {
    swapDeck(_p1Win, _p1Play);
      }
  }
  //if cpu hand empty
  if (_p2Play.isEmpty()){
      //if win also empty, game won
      if (_p2Win.isEmpty()){
    winGame();
      }
      //if not, puts win in play, shuffles
      else {
    swapDeck(_p2Win, _p2Play);
      }
  }
  
  
  System.out.println ("Declaring War");
    background = loadImage("GameScreen.jpg");
    image(background,0,0);
    //PImage declaration = loadImage("WARButton1.jpg");
    //image(declaration,300,200);
    
    PImage deck = loadImage("CardDeck.jpg");
    image(deck, 100,150);
    image(deck, 225, 150);

  delay(200);
  //print out what each give
  
    mouseClicked();
    //PImage warpressed = loadImage("WARButton2.jpg");
    //image(warpressed,300,200);
    
  System.out.println("You: " + _p1Play.peekCard(0) + "\n" +
         "CPU: " + _p2Play.peekCard(0));
         
         delay(500);
         _p1Play.peekCard(0);
         image(currentCard,300,300);
         delay(500);
         _p2Play.peekCard(0);

  //if player win, set as winner and put cards in _winPile
  if(_p1Play.peekCard(0) > _p2Play.peekCard(0)){
    text("Win!",300,300);
    background = loadImage("YouWin.jpg");
    image(background,0,0);
    delay(500);
    image(background,0,0);
    image(deck,100,150);
    image(deck,225,150);
    //image(declaration,300,200);
      System.out.println("You won this round!");
      temp = _p1Win;
      _winPile.drawFrom(_p1Play, 0);
      _winPile.drawFrom(_p2Play, 0);
  }
  //if cpu win, set as winner and put cards in _winPile
  else if (_p1Play.peekCard(0) < _p2Play.peekCard(0)){
        text("Lose!",300,300);
            background = loadImage("YouLose.jpg");
    image(background,0,0);
        delay(500);
    image(background,0,0);
    delay(200);
    image(deck,100,150);
    image(deck,225,150);
       // image(declaration,300,200);
      System.out.println("You lost this round");
      temp = _p2Win;
      _winPile.drawFrom(_p1Play, 0);
      _winPile.drawFrom(_p2Play, 0);
  }

  //if tie, Sop tell, put cards in _winPile, calls play recursively
  else{
    delay(200);
    text("Tie!",300,300);
    delay(200);
    image(background,0,0);
    image(deck,100,150);
    delay(200);
    image(deck,225,150);
      System.out.println("You have both played the same card, " + 
             "play another");
                // image(declaration,300,200);
      _winPile.drawFrom(_p1Play, 0);
      _winPile.drawFrom(_p2Play, 0);
      this.playWar();
  }

  swapDeck(_winPile, temp);
  
}