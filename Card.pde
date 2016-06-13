class Card{
    int value;
    PImage face;

   Card(int num){
  value= num;
  face= null;
    }
    
    public Card(int num, PImage img){
  value= num;
  face= img;
    }

    //accessors
    int getValue(){
  return value;
    }
    PImage getFace(){
  return face;
    }

}