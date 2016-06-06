public class OldMaid{
    //match and discard pairs in given deck
    public static void discardPairs(Deck deck){
	for(int i=0; i<deck.getSize(); i++){
	    for (int j=i+1; j<deck.getSize(); j++){
		if (deck.peekCard(i).getValue()==deck.peekCard(j).getValue()){
		    deck.removeCard(j).getValue();
		    deck.removeCard(i).getValue();
		     j=i;
		}
	
	    }
	}
    }
    
    public static void main(String[] args){
    Deck deck= new Deck(52);
    Deck player= new Deck();
    Deck cpu= new Deck();

    System.out.println("Original deck:\n"+deck);//testing
    System.out.println("Original player hand:\n"+ player);//testing
    System.out.println("Original cpu hand:\n"+cpu);//testing
    deck.shuffle();
    System.out.println("Deck after shuffling:\n"+deck);//testing
    deck.removeCard(0);
    for (int i=0; i<51; i++){
	if (i%2==0){
	    player.addCard(deck.draw());
	}else{
	    cpu.addCard(deck.draw());
	}
    }
    System.out.println("Deck after distributing:\n"+ deck);//testing
    System.out.println("Player hand after distributing:\n"+player);//testing
    System.out.println("cpu hand after distributing:\n"+cpu);//testing

    System.out.println("\nGame starts");//testing
    System.out.println("Discarding pairs");//testing
    discardPairs(player);
    discardPairs(cpu);
    System.out.println("Player:\n"+player);//testing
    System.out.println("CPU:\n"+cpu);//testing
    }
}


