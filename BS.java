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

	System.out.println("Enter a name for CPU1");
	String CPU1= Keyboard.readString();
	System.out.println("Enter a name for CPU2");
        String CPU2= Keyboard.readString();	
	System.out.println("Enter a name for CPU3");
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
    }

    public void play(){
	
    }

    public void main(String args){
	BS game = new BS();
	
    }
}
