import cs1.Keyboard;
import java.util.*;

public class BS {

    Deck deck; //original deck
    Deck player; 
    Deck cpu1;
    Deck cpu2;
    Deck cpu3;

    public BS(){
	deck = new Deck(52);
	player = new Deck();
	cpu1 = new Deck();
	cpu2 = new Deck();
	cpu3 = new Deck();

	System.out.print("Enter a name for CPU1: ");
	String CPU1= Keyboard.readString();
	System.out.print("Enter a name for CPU2: ");
        String CPU2= Keyboard.readString();	
	System.out.print("Enter a name for CPU3: ");
	String CPU3= Keyboard.readString();

	System.out.println("Starting game");
	System.out.println("Shuffling cards");
	deck.shuffle();

	System.out.println("Distributing cards");
	for (int i=0; i<52; i += 4){
	    player.drawFrom(deck, 0);
	    cpu1.drawFrom(deck, 0);
	    cpu2.drawFrom(deck, 0);
	    cpu3.drawFrom(deck, 0);
	}

	sort(player);
	sort(cpu1);
	sort(cpu2);
	sort(cpu3);

	System.out.println("You: " + player + "\n" +
			   CPU1 + ":  " + cpu1 + "\n" +
			   CPU2 + ":  " + cpu2 + "\n" +
			   CPU3 + ":  " + cpu3);
			  
    }

    public void play(){
	
    }

    public void sort(Deck hand){
	for( int passCtr = 1; passCtr < hand.getSize(); passCtr++ ) {
	    //System.out.println( "commencing pass #" + passCtr + "..." );

	    //iterate thru first to next-to-last element, comparing to next
	    for( int i = 0; i < hand.getSize()-1; i++ ) {

		//if element at i > element at 1+1, swap
		if ( hand.peekCard(i) > hand.peekCard(i+1) )
		    swap(hand, i, i+1);
		
		//System.out.println(data); //diag: show current state of list
	    }
	}
    }

    public void swap(Deck d, int x, int y){
	Card temp = d.getCard(x);
	d.setCard(x, d.getCard(y));
	d.setCard(y, temp);


    }

    public static void main(String[] args){
	BS game = new BS();
	
    }
}
