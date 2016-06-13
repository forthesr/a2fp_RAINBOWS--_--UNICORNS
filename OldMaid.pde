

public class OldMaid{
    //match and discard pairs in given deck
    
    void discardPairs(Deck deck){
  for(int i=0; i<deck.getSize(); i++){
      for (int j=i+1; j<deck.getSize(); j++){
    if (deck.peekCard(i)==deck.peekCard(j)){
        System.out.println(deck.discard(j).getValue()+" and "+deck.discard(i).getValue()+" were paired and discarded");
        j=i;
    }
      }
  }
    }

    void playOldMaid() {
      background(400);
  Deck deck= new Deck(52);
  Deck player= new Deck();
  Deck cpu= new Deck();
  int wins = 0;
  int losses = 0;
  String dialogue = "";

  String CPU= "TsunDonut";

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
        System.out.println(CPU1+"'s turn");
        ran= (int)(Math.random()*cpu2.getSize());
        cpu1.drawFrom(cpu2, ran);
        System.out.println(CPU1+" drew a card from "+CPU2);
        discardPairs(cpu1);
        cpu1.shuffle();
        cpu2.shuffle();
        if(cpu1.getSize()==0)
      System.out.println(CPU1+ " has won");
    }
    c++;
      }
      if(c%4==2){
    if(cpu2.getSize()!=0){
        System.out.println(CPU2+"'s turn");
        ran= (int)(Math.random()*cpu3.getSize());
        cpu2.drawFrom(cpu3, ran);
        System.out.println(CPU2+" drew a card from "+CPU3);
        discardPairs(cpu2);
        cpu2.shuffle();
        cpu3.shuffle();
        if(cpu2.getSize()==0)
      System.out.println(CPU2+ " has won");
    }
    c++;
      }
      if(c%4==3){
    if(cpu3.getSize()!=0){
        System.out.println(CPU3+"'s turn");
        ran= (int)(Math.random()*player.getSize());
        System.out.println(CPU3+" drew a "+player.peekCard(ran)+" from you");
        cpu3.drawFrom(player, ran);
        discardPairs(cpu3);
        cpu3.shuffle();
        player.shuffle();
        if(cpu3.getSize()==0)
      System.out.println(CPU3+ " has won");
    }
    c++;
      }
      if(c%4==0){
    if(player.getSize()==0){
        System.out.println("CONGRATS!!!! YOU WON!!!");
        break;
    }
    if(cpu1.getSize()==0 && cpu2.getSize()==0 && cpu3.getSize()==0){
        System.out.println("Sorry, you lost");
        break;
    }
    System.out.println("Your turn");
    System.out.println("Here are your cards: "+player);
    System.out.println("Which card would you like to choose from "+CPU1 +"? (0-"+(cpu1.getSize()-1)+ ")");
    ran= Keyboard.readInt();
    System.out.println("You drew a "+cpu1.peekCard(ran)+" from "+CPU1);
    player.drawFrom(cpu1, ran);
    discardPairs(player);
    player.shuffle();
    cpu3.shuffle();
    c++;
    if(player.getSize()==0){
        System.out.println("CONGRATS!!!! YOU WON!!!");
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
}//end class