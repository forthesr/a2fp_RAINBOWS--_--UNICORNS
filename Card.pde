class Card{
    int value;
    String face;

   Card(int num){
  value= num;
  face= null;
    }
    
    public Card(int num, String img){
  value= num;
  face= img;
    }

    //accessors
    int getValue(){
  return value;
    }
    String getFace(){
  return face;
    }

}