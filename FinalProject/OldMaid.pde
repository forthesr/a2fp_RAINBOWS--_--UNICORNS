//Why is discardPairs the first method in OldMaid class
//Why is there no summary about the class
//Or this method
//Are these high school kids programming or something
//Argh
//YOUR FIRST MISTAKE IS DISTRIBUTING CARDS
//FIRST OF ALL
//OK YOU KNOW WHAT
//THIS IS A HUGE MESS
//I HOPE YOURE PROUD OF YOUSRELF. 
//IM LOOKING AT U PERSON WHO WROTE THIS
//IF U CAN HAND THIS IN EARLY
//U HAVE TIME TO CHECK UR OWN MISTAKES. 

//This picks out two cards from witin your deck and 
//Checks wthether or not they are a pair
//what does this code even do
//why does no one comment their code
//what are they teaching you ikids these days
    void discardPairs(Deck deck){
      //print("IN DISCARD PAIRS");
      for(int i=0; i<deck.getSize(); i++){ 
    //print("IN DECK SIZE "+ i);
        for (int j=i+1; j<deck.getSize(); j++){
      //  print("j : " + j);
          if (deck.peekCard(i)==deck.peekCard(j)){
            System.out.println(deck.discard(j).getValue()+" and "+deck.discard(i).getValue()+" were paired and discarded");
            j=i;
        //animation of a pair forming mid screen before dissapearing
          }
        }
      }
    }

    void playOldMaid() {
          background = loadImage("OldMaidStartScreen.jpg");
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
  
          deck.shuffle();
          deck.discard();
          System.out.println("Distributing cards");
          for (int i=0; i<51; i++){
            if (i%4==0){
              player.drawFrom(deck, 0); 
              //print("player has this card: " + i);
            }
            else if (i%4==1){
      cpu1.drawFrom(deck, 0); //print("cpu1 has this card: " + i);
      }
      else if (i%4==2)
     {
       cpu2.drawFrom(deck, 0); //print ("cpu2 has this card : " + i);
     }
     else{
    cpu3.drawFrom(deck, 0); //print ("cpu3 hs this card: " + i);
      }
      //deck in middle gets split into four hands
  }

  System.out.println("Discarding pairs");//testing
  discardPairs(player);
  discardPairs(cpu1);
  discardPairs(cpu2);
  discardPairs(cpu3);

  int c= 1;
  int ran;

  while(player.getSize()!=0){
      if(c%4==1){ //WHAT IS C? COMMENT YOUR CODE FOOL. 
    if(cpu1.getSize()!=0){
        System.out.println("\n\n"+CPU1+"'s turn");
        ran= (int)(Math.random()*cpu2.getSize());
        
        System.out.println(CPU1+" drew a card from "+CPU2);
        cpu1.drawFrom(cpu2, ran);

        System.out.println(CPU1+ " is discarding pairs");
        discardPairs(cpu1);
        
        if(cpu1.getSize()==0||cpu2.getSize()==0){
       background = loadImage("YouLose.jpg");
       image(background, 0, 0);
       print("You Lost");
     return;}
     print("shuffling");
        cpu1.shuffle();
        cpu2.shuffle();
    }
    c++; //WHY NOT A++?
      }
      if(c%4==2){
    if(cpu2.getSize()!=0){
      System.out.println("\n\n"+CPU2+"'s turn");
        ran= (int)(Math.random()*cpu3.getSize());
        cpu2.drawFrom(cpu3, ran);
        System.out.println(CPU2+" drew a card from "+CPU3);
        System.out.println(CPU2+ " is discarding pairs");
        
        discardPairs(cpu2);
        
        if(cpu2.getSize()==0||cpu3.getSize()==0){
       background = loadImage("YouLose.jpg");
       image(background, 0, 0);
       print("You Lost");
     return;}
     print("shuffling");
        cpu2.shuffle();
        cpu3.shuffle();
    }
    c++;
      }
      
      
      if(c%4==3){
        if(cpu3.getSize()!=0){
          System.out.println("\n\n"+CPU3+"'s turn");
            ran= (int)(Math.random()*player.getSize());
            System.out.println(CPU3+" drew a "+player.peekCard(ran)+" from you");
            cpu3.drawFrom(player, ran);
            System.out.println(CPU3+" is discarding pairs");
            discardPairs(cpu3);
            
            if(cpu3.getSize()==0){
           background = loadImage("YouLose.jpg");
           image(background, 0, 0);
           print("You Lost");
           return;
        }
        if(player.getSize()==0){
          background = loadImage("YouWin.jpg");
     print("You won!");
        break;
        }
        print("shuffling");
            cpu3.shuffle();
            player.shuffle();
    c++;
      }
      if(c%4==0){
        
    if(cpu1.getSize()==0 && cpu2.getSize()==0 && cpu3.getSize()==0){
      //screen goes to you lost screen
     background = loadImage("YouLose.jpg");
     System.out.println("You Lost");
        break;
    }
  System.out.println("\n\n Your turn");
    text("Your Turn",100,100);
    text("Your cards", 120,150);
    for (int i = 0; i < player.getSize(); i++){
      player.peekCard(i);
    }
    text("Pick a card",100,100);
    int line = 200;
    PImage cardback;
    for (int i = 0; i < cpu1.getSize(); i++){
      cardback = loadImage("CardBack.jpg");
      image(cardback, 300, line);
      line = line + 50;
    }
    ran= (int)(Math.random()*cpu1.getSize());
    
    print("you are discarding from cpu1");
    player.drawFrom(cpu1, ran);
    //image(background,0,0);
    
    System.out.println("You are discarding pairs");
    discardPairs(player);
    
    c++;
    if(player.getSize()==0){
     background = loadImage("YouWin.jpg");
     print("You won!");
        break;
    }
    if(cpu1.getSize()==0){
       background = loadImage("YouLose.jpg");
           image(background, 0, 0);
           print("You Lost");
           return;
    }
    print("shuffling");
    player.shuffle();
    cpu3.shuffle();
      }
  }
      

    }//end main


  }