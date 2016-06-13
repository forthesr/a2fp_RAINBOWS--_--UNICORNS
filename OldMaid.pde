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
  for(int i=0; i<deck.getSize()-1; i++){ 
    //print("IN DECK SIZE "+ i);
      for (int j=i+1; j<deck.getSize()-1; j++){
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
      {
      player.drawFrom(deck, 0); 
      print("player has this card: " + i);
      }
      else if (i%4==1)
      {
      cpu1.drawFrom(deck, 0); print("cpu1 has this card: " + i);
      }
      else if (i%4==2)
     {
       cpu2.drawFrom(deck, 0); print ("cpu2 has this card : " + i);
     }
     else{
    cpu3.drawFrom(deck, 0); print ("cpu3 hs this card: " + i);
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
      if(c%4==1){ //WHAT IS C? COMMENT YOUR CODE FOOL. 
    if(cpu1.getSize()!=0){
        ran= (int)(Math.random()*cpu2.getSize());
        cpu1.drawFrom(cpu2, ran);
        System.out.println(CPU1+" drew a card from "+CPU2);
      
        print("Discarding pairs for cpu1, their size is: " + cpu1.getSize());

        discardPairs(cpu1);
        cpu1.shuffle();
        cpu2.shuffle();
        if(cpu1.getSize()==0)
       background = loadImage("YouLose.jpg");
       image(background, 0, 0);
    }
    c++; //WHY NOT A++?
      }
      if(c%4==2){
    if(cpu2.getSize()!=0){
        ran= (int)(Math.random()*cpu3.getSize());
        cpu2.drawFrom(cpu3, ran);
        System.out.println(CPU2+" drew a card from "+CPU3);
                print("Discarding pairs for cpu2. their sizeis:" + cpu2.getSize());

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
        print("discard pairs cpi3 their size is: " + cpu3.getSize());
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
    
    print("you are discarding from cpu1");
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


 