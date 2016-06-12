/* War: 

 */

import cs1.Keyboard;
import java.util.*;

public class War {

    private static boolean fin = false;
    private Deck _winPile = new Deck();

    //players' hands
    private Deck _p1Play = new Deck();
    private Deck _p2Play = new Deck();

    //players' win piles
    private Deck _p1Win = new Deck();
    private Deck _p2Win = new Deck();

    
    public War(){
	
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

	System.out.println("P1: " + _p1Play + "\nP2: " + _p2Play);
    }

    public void play(){
	Deck temp = _p1Play;
	if (_p1Play.isEmpty()){
	    if (_p1Win.isEmpty()){
		loseGame();
	    }
	    else {
		swapDeck(_p1Win, _p1Play);
	    }
	}
	if (_p2Play.isEmpty()){
	    if (_p2Win.isEmpty()){
		winGame();
	    }
	    else {
		swapDeck(_p2Win, _p2Play);
	    }
	}
	
	System.out.println ("Declare War? (y): ");
	String ans = Keyboard.readString();
	System.out.println("You: " + _p1Play.peekCard(0) + "\n" +
			   "CPU: " + _p2Play.peekCard(0));
	    
	if(_p1Play.peekCard(0) > _p2Play.peekCard(0)){
	    System.out.println("You won this round!");
	    temp = _p1Win;
	    _winPile.drawFrom(_p1Play, 0);
	    _winPile.drawFrom(_p2Play, 0);
	}
	else if (_p1Play.peekCard(0) < _p2Play.peekCard(0)){
	    System.out.println("You lost this round");
	    temp = _p2Win;
	    _winPile.drawFrom(_p1Play, 0);
	    _winPile.drawFrom(_p2Play, 0);
	}
	else{
	    System.out.println("You have both played the same card, " + 
			       "play another");
	    _winPile.drawFrom(_p1Play, 0);
	    _winPile.drawFrom(_p2Play, 0);
	    this.play();
	}

	swapDeck(_winPile, temp);

	System.out.println("You: " + _p1Win + "\n" +
			   "CPU: " + _p2Win);
	
    }

    public void swapDeck(Deck win, Deck play){
	while (win.getSize() > 0)
	    play.drawFrom(win, 0);
	/*Deck temp = play;
	play  = win;
	win = temp;*/
	play.shuffle();
    }

    public void winGame(){
	System.out.println("YAY!! You win!!");
	fin = true;
    }
   
    public void loseGame(){
	System.out.println("You dumb loser.");
	fin = true;
    }

    public static void main(String[] args){
	//War p1 = new War();
	War game = new War();
	while (fin != true)
	    game.play();
    }
    
	
}
