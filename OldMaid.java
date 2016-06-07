import cs1.Keyboard;
import java.util.*;

public class OldMaid{
    //match and discard pairs in given deck
    public static void discardPairs(Deck deck){
	for(int i=0; i<deck.getSize(); i++){
	    for (int j=i+1; j<deck.getSize(); j++){
		if (deck.peekCard(i)==deck.peekCard(j)){
		    System.out.println(deck.discard(j).getValue()+" and "+deck.discard(i).getValue()+" were paired and discarded");
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
	deck.discard();
	for (int i=0; i<51; i++){
	    if (i%2==0)
		player.addCard(deck.discard());
	    else{
		cpu.addCard(deck.discard());
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

	int ran= (int)(Math.random()*1);
	if(ran==0){
	    System.out.println("CPU goes first");//testing
	    
	    while(player.getSize()!=0&& cpu.getSize()!=0){
		ran=(int)(Math.random()*player.getSize());
		System.out.println(ran+ " index was chosen");//testing
		System.out.println(player.peekCard(ran)+ " taken from player");//testing
		cpu.drawFrom(player, ran);
		discardPairs(cpu);
		cpu.shuffle();
		System.out.println("CPU: "+cpu);
		
		if (player.getSize()==0&& cpu.getSize()==0){
		    break;
		}
		System.out.println("CPU: "+cpu);
		System.out.println("Which card would you like to choose? (0-"+(cpu.getSize()-1)+ ")");//testing
		int choice= Keyboard.readInt();
		System.out.println(cpu.peekCard(choice)+ " taken from cpu");//testing
		player.drawFrom(cpu, choice);
		discardPairs(player);
		player.shuffle();
		System.out.println("Player: "+player);
		System.out.println("CPU: "+cpu);

	    }//end while
	}//end if
    }//end main
}//end class


