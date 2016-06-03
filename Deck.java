import java.util.ArrayList;

public class Deck{
    private ArrayList<Card> _deck;
    private int _size;

    //creates empty deck (used for hands)
    public Deck(){
	_deck= new ArrayList<Card>();
	_size=0;
    }

    //creates a default deck when argument is "52"
    public Deck(int num) {
	this();
	String[] str= {"♥", "♠", "♦", "♣"};
	if (num== 52){
	    for (String s: str){
		for(int i= 1; i<=13; i++){
		    Card c= new Card(i, s);
		    _deck.add(c);
		    _size++;
		}
	    }
	}else{
	    System.out.println("Wrong number");	
	}
    }
    
    //adds Card c to the deck
    public void addCard( Card c ) {
        _deck.add(c);
	_size++;
    }

    //removes the top card from the deck (end of ArrayList)
    public Card draw() {
	if (isEmpty()){
	    throw new NullPointerException();
	}else{
	    return _deck.remove(_deck.size()-1);
	}
    }

    //returns the top card (end of ArrayList)
    public Card peekDeck() {
	return _deck.get(_deck.size()-1);
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
