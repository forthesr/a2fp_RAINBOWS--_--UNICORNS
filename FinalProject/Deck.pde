PImage currentCard;

public class Deck{
    ArrayList<Card> _deck;

    //creates empty deck (used for hands)
    public Deck(){
  _deck= new ArrayList<Card>();
    }

   //creates a default deck when argument is "52"
    public Deck(int num) {
  this();
  String[] str= {"Spade", "Hearts", "Clubs", "Diamonds"};
  if (num== 52){
      for (String s: str){
    for(int i= 1; i<=13; i++){
      currentCard = loadImage("Card" + s + i);
        Card c= new Card(i, currentCard);
        _deck.add(c);
    }  
      }
  }else{
      System.out.println("Wrong number");  
  }
    }
    
    //adds Card c to the deck
    void addCard( Card c ) {
        _deck.add(c);
    }
    Card getCard(int num){
  return(_deck.get(num));
    }

    //removes the top card from the deck (beginning of ArrayList)
    Card discard() {
  if (isEmpty()){
      throw new NullPointerException();
  }else{
      return _deck.remove(0);
  }
    }

    //removes the card at index i
    Card discard(int i){
  if (i<0||i>=_deck.size()){
      throw new NullPointerException();
  }else{
      return _deck.remove(i);
  }
    }
    
    //returns the card at index i
    public int peekCard(int i) {
  return _deck.get(i).getValue();
    }
    
    //shuffles the deck
    public void shuffle () {
  for (int i=0; i<_deck.size();i++){
      int r= (int)(Math.random()*_deck.size());
      swap(i, r);
      //SHUFFLE ANIMATION?!?!??!!??!/????????????????????????
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
    
    public void drawFrom(Deck other, int num){
  _deck.add(other.discard(num));
    }


}