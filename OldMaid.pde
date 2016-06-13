   
    void discardPairs(Deck deck){
  for(int i=0; i<deck.getSize(); i++){
      for (int j=i+1; j<deck.getSize(); j++){
    if (deck.peekCard(i)==deck.peekCard(j)){
        System.out.println(deck.discard(j).getValue()+" and "+deck.discard(i).getValue()+" were paired and discarded");
        j=i;
        //animation of a pair forming mid screen before dissapearing
    }
      }
  }
}

    void playOldMaid() {
           background = loadImage("GameScreen.jpg");
  Deck deck= new Deck(52);
  Deck player= new Deck();
  Deck cpu1= new Deck();
  Deck cpu2= new Deck();
  Deck cpu3= new Deck();
  int wins = 0;
  int losses = 0;
  String dialogue = "";

  String CPU1 = "TsunDonut";
  String CPU2 = "InvisibleMan";
  String CPU3 = "BurgerCat";
  

  System.out.println("Distributing cards");
  for (int i=0; i<51; i++){
      if (i%4==0)
    player.drawFrom(deck, 0);
      else if (i%4==1)
    cpu1.drawFrom(deck, 0);
      else if (i%4==2)
    cpu2.drawFrom(deck, 0);
      else{
    cpu3.drawFrom(deck, 0);
      }
      //deck in middle gets split into four hands
  }

  System.out.println("Discarding pairs");//testing
  discardPairs(player);
  discardPairs(cpu1);
  discardPairs(cpu2);
  discardPairs(cpu3);

  int c= (int)(Math.random()*4);
  int ran;

  while(player.getSize()!=0){
      if(c%4==1){
    if(cpu1.getSize()!=0){
        ran= (int)(Math.random()*cpu2.getSize());
        cpu1.drawFrom(cpu2, ran);
        System.out.println(CPU1+" drew a card from "+CPU2);
        discardPairs(cpu1);
        cpu1.shuffle();
        cpu2.shuffle();
        if(cpu1.getSize()==0)
       background = loadImage("YouLose.jpg");
       image(background, 0, 0);
    }
    c++;
      }
      if(c%4==2){
    if(cpu2.getSize()!=0){
        ran= (int)(Math.random()*cpu3.getSize());
        cpu2.drawFrom(cpu3, ran);
        System.out.println(CPU2+" drew a card from "+CPU3);
        discardPairs(cpu2);
        cpu2.shuffle();
        cpu3.shuffle();
        if(cpu2.getSize()==0)
       background = loadImage("YouLose.jpg");
       image(background, 0, 0);
    }
    c++;
      }
      if(c%4==3){
    if(cpu3.getSize()!=0){
        ran= (int)(Math.random()*player.getSize());
        System.out.println(CPU3+" drew a "+player.peekCard(ran)+" from you");
        cpu3.drawFrom(player, ran);
        discardPairs(cpu3);
        cpu3.shuffle();
        player.shuffle();
        if(cpu3.getSize()==0)
       background = loadImage("YouLose.jpg");
       image(background, 0, 0);
    }
    c++;
      }
      if(c%4==0){
    if(player.getSize()==0){
     background = loadImage("YouWin.jpg");
        break;
    }
    if(cpu1.getSize()==0 && cpu2.getSize()==0 && cpu3.getSize()==0){
      //screen goes to you lost screen
     background = loadImage("YouLose.jpg");
        break;
    }
    
    text("Your Turn",100,100);
    text("Your cards", 120,150);
    for (int i = 1; i <= player.getSize(); i++){
      player.peekCard(i);
    }
    text("Pick a card",100,100);
    int line = 200;
    for (int i = 1; i <= cpu1.getSize(); i++){
      image(cardback, 300, line);
      line = line + 50;
    }
    ran= (int)(Math.random()*player.getSize());
    player.drawFrom(cpu1, ran);
    cpu1.peekCard(ran);
    image(background,0,0);
    discardPairs(player);
    player.shuffle();
    cpu3.shuffle();
    c++;
    if(player.getSize()==0){
     background = loadImage("YouWin.jpg");
        break;
    }
      }
  }
      
  // while(player.getSize()!=0&& cpu.getSize()!=0){
  //   ran=(int)(Math.random()*player.getSize());
  //   System.out.println(player.peekCard(ran)+ " taken from player");//testing
  //   cpu.drawFrom(player, ran);
  //   discardPairs(cpu);
  //   cpu.shuffle();
    
  //   if (player.getSize()==0&& cpu.getSize()==0){
  //       break;
  //   }
  //   System.out.println("Which card would you like to choose? (0-"+(cpu.getSize()-1)+ ")");//testing
  //   int choice= Keyboard.readInt();
  //   player.drawFrom(cpu, choice);
  //   discardPairs(player);
  //   player.shuffle();
  //   System.out.println("Player: "+player);
  //   //System.out.println("CPU: "+cpu);

    }//end main


 