/* War: 

 */

import cs1.Keyboard;
import java.util.*;

public class War {

    private boolean fin = false;

    //players' hands
    private Deck _p1Play;
    private Deck _p2Play;

    //players' win piles
    private Deck _p1Win;
    private Deck _p2Win;
    
    public War(){
	
	Deck blah = new Deck(52);
	blah.shuffle();

	System.out.println("Starting game");
	System.out.println("Shuffling cards");

	System.out.println("Distributing cards");
	//splits the deck
	while (blah.getSize() > 0){
	    _p1Play.drawFrom(blah, 0);
	    _p2Play.drawFrom(blah, 0);
	}
    }

    public void play(){
	Deck temp;
	if (_p1Play.isEmpty()){
	    if (_p1Win.isEmpty()){
		loseGame();
	    }
	    else {
		swapDeck(_p1Win, _p1Play);
	    }
	}
	else if (_p2Play.isEmpty()){
	    if (_p2Win.isEmpty()){
		winGame();
	    }
	    else {
		swapDeck(_p2Win, _p2Play);
	    }
	}
	
	System.out.println ("Declare War? (y): ");
	int ans = Keyboard.readString();
	System.out.println("You: " + _p1Play.peekCard(0) + "/n" +
			   "CPU: " + _p2Play.peekCard(0));
	if(_p1Play.peekCard(0) > _p2Play.peekCard(0)){
	    temp = _p1Win;
	    temp.drawFrom(_p1Play, 0);
	    temp.drawFrom(_p2Play, 0);
	}
	else if (_p1Play.peekCard(0) < _p2Play.peekCard(0)){
	    temp = _p2Win;
	    temp.drawFrom(_p1Play, 0);
	    temp.drawFrom(_p2Play, 0);
	}
	else{
	    System.out.println("You have both played the same card, " + 
			       "play another");
	    this.play();
	    temp.drawFrom(_p1Play, 0);
	    temp.drawFrom(_p2Play, 0);
	}
	    
	
    }

    public void swapDeck(Deck win, Deck play){
	Deck temp = play;
	play  = win;
	win = temp;
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

    public void Main(String args){
	//War p1 = new War();
	War game = new War();
	while (fin != true)
	    game.play();
    }
    
	
}
