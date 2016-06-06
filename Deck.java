import java.util.ArrayList;

public class Deck{
    private ArrayList<Card> _deck;

    //creates empty deck (used for hands)
    public Deck(){
	_deck= new ArrayList<Card>();
    }

    //creates a default deck when argument is "52"
    public Deck(int num) {
	this();
	String[] str= {"S", "H", "C", "D"};
	if (num== 52){
	    for (String s: str){
		for(int i= 1; i<=13; i++){
		    Card c= new Card(i, s);
		    _deck.add(c);
		}
	    }
	}else{
	    System.out.println("Wrong number");	
	}
    }
    
    //adds Card c to the deck
    public void addCard( Card c ) {
        _deck.add(c);
    }

    //removes the top card from the deck (beginning of ArrayList)
    public Card draw() {
	if (isEmpty()){
	    throw new NullPointerException();
	}else{
	    return _deck.remove(0);
	}
    }

    //removes the card at index i
    public Card removeCard(int i){
	if (i<0||i>=_deck.size()){
	    throw new NullPointerException();
	}else{
	    return _deck.remove(i);
	}
    }

    //returns the card at index i
    public Card peekCard(int i) {
	return _deck.get(i);
    }


    //shuffles the deck
    public void shuffle () {
	for (int i=0; i<_deck.size();i++){
	    int r= (int)(Math.random()*_deck.size());
	    swap(i, r);
	}
    }

    //swaps the cards at the given index
    public void swap(int x, int y){
	Card temp= _deck.get(x);
	_deck.set(x, _deck.get(y));
	_deck.set(y, temp);
    }

    //returns whether the deck is empty
    public boolean isEmpty() {
	return _deck.size()==0;}//O(1)

    //returns the size of the deck
    public int getSize(){
	return _deck.size();
    }

    // print each node, separated by spaces
    public String toString() { 
	String ret="";
	for (Card c: _deck){
	    ret+=c.getValue()+c.getFace()+"  ";
	}
	return ret;
    }

    public static void main(String[] arg){
	Deck hand= new Deck();
	Deck deck= new Deck(52);
	System.out.println("Initial Hand: "+hand);
	System.out.println("Initial Deck: "+deck);
	deck.shuffle();
	System.out.println("Shuffled Deck: "+deck);
	hand.addCard(deck.draw());
	System.out.println("Adding to Hand: "+hand);
	System.out.println("After drawing from Deck: "+deck);
    }
}
