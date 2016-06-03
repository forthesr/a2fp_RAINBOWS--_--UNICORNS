import java.util.ArrayList;

public class Deck{
    private ArrayList<Card> _deck;
    private int _size;

    public Deck(){
	_deck= new ArrayList<Card>();
	_size=0;
    }

    // default constructor creates a default deck
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
    
    public void addCard( Card c ) {
        _deck.add(c);
	_size++;
    }

    public Card draw() {
	if (isEmpty()){
	    throw new NullPointerException();
	}else{
	    return _deck.remove(0);
	}
    }


    public Card peekDeck() {
	return _deck.get(0);
    }


    public void shuffle () {
	for (int i=0; i<_deck.size();i++){
	    int r= (int)(Math.random()*_deck.size());
	    swap(i, r);
	}
    }

    public void swap(int x, int y){
	Card temp= _deck.get(x);
	_deck.set(x, _deck.get(y));
	_deck.set(y, temp);
    }
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
