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

    public static Deck getNextDeck(Deck d2, Deck d3, Deck d4){
	if (d2.getSize()>0){
	    return d2;
	}else if(d3.getSize()>0)
	    return d3;
	else return d4;
    }

    public static void main(String[] args){
	Deck deck= new Deck(52);
	Deck player= new Deck();
	Deck cpu1= new Deck();
	Deck cpu2= new Deck();
	Deck cpu3= new Deck();	

	System.out.println("Starting game");
	System.out.println("Shuffling cards");
	deck.shuffle();
	System.out.println("Discarding a card");
	deck.discard();

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
	Deck temp;

	while(player.getSize()!=0){
	    if(c%4==1){
		if(cpu1.getSize()!=0){
		    System.out.println("CPU1's turn");
		    temp= getNextDeck(cpu2, cpu3, player);
		    ran= (int)(Math.random()*temp.getSize());
		    System.out.println("CPU1 drew a card");
		    cpu1.drawFrom(temp, ran);
		    discardPairs(cpu1);
		    cpu1.shuffle();
		    temp.shuffle();
		    if(cpu1.getSize()==0)
			System.out.println("CPU1 has won");
		}
		c++;
	    }
	    if(c%4==2){
		if(cpu2.getSize()!=0){
		    System.out.println("CPU2's turn");
		    temp= getNextDeck(cpu3, player, cpu1);
		    ran= (int)(Math.random()*temp.getSize());
		    cpu2.drawFrom(temp, ran);
		    System.out.println("CPU2 drew a card");
		    discardPairs(cpu2);
		    cpu2.shuffle();
		    temp.shuffle();
		    if(cpu2.getSize()==0)
			System.out.println("CPU2 has won");
		}
		c++;
	    }
	    if(c%4==3){
		if(cpu3.getSize()!=0){
		    System.out.println("CPU3's turn");
		    temp= getNextDeck(player, cpu1, cpu2);
		    ran= (int)(Math.random()*temp.getSize());
		    System.out.println("CPU3 drew a card");
		    cpu3.drawFrom(temp, ran);
		    discardPairs(cpu3);
		    cpu3.shuffle();
		    temp.shuffle();
		    if(cpu3.getSize()==0)
			System.out.println("CPU3 has won");
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
		temp= getNextDeck(cpu1, cpu2,cpu3);
		System.out.println("Which card would you like to choose? (0-"+(temp.getSize()-1)+ ")");
		ran= Keyboard.readInt();
		System.out.println("You drew a "+temp.peekCard(ran));
		player.drawFrom(temp, ran);
		discardPairs(player);
		System.out.println("Your hand: "+player);
		player.shuffle();
		temp.shuffle();
		c++;
		if(player.getSize()==0){
		    System.out.println("CONGRATS!!!! YOU WON!!!");
		    break;
		}
	    }
	}
	    

    }//end main
}//end class


