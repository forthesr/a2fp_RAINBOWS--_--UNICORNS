public class Card{
    private int value;
    private String face;

    public Card(int num){
	value= num;
	face= null;
    }
    public Card(int num, String str){
	value= num;
	face= str;
    }

    //accessors
    public int getValue(){
	return value;
    }
    public String getFace(){
	return face;
    }

}
