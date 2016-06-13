import cs1.Keyboard;
public class BlackJack{
    public static  boolean dealerDraw(Deck _deal){
	return getFinalVal(_deal)< 17;
    }

    public static boolean cpu1Draw(Deck _cpu1){
	return getFinalVal(_cpu1)< 20;
    }
    
    public static boolean cpu2Draw(Deck _cpu2){
	return getFinalVal(_cpu2)< 15;
    }

    public static boolean playerDraw(Deck player){
	return getFinalVal(player)< 21;
    }
    
    public static int getHardVal(Deck d){
	int total1= 0;
	for(int i=0; i<d.getSize();i++)
	    total1+= d.getCard(i).getValue();
	return total1;
    }
    public static int getSoftVal(Deck d){
	int total2= getHardVal(d);
	for (int i=getAce(d); i>0; i--)
	    total2= getHardVal(d)+ 10;
	return total2;
    }
    public static int getAce(Deck d){
	int a= 0;
	for(int i=0; i<d.getSize();i++)
	    if (d.getCard(i).getValue()==1)
		a++;
	return a;
    }

    public static int getFinalVal(Deck d){
	if (getSoftVal(d)<=21){
	    return getSoftVal(d);
	}else
	    return getHardVal(d);
    }

    public static void main(String[] args){
	Deck deck= new Deck(10);
	Deck player= new Deck();
	Deck dealer= new Deck();
	Deck cpu1= new Deck();
	Deck cpu2= new Deck();

	System.out.println("Game starting");
	deck.shuffle();
	deck.shuffle();
	dealer.drawFrom(deck, 0);
	dealer.drawFrom(deck, 0);
	player.drawFrom(deck, 0);
	player.drawFrom(deck, 0);
	cpu1.drawFrom(deck, 0);
	cpu1.drawFrom(deck, 0);
	cpu2.drawFrom(deck, 0);
	cpu2.drawFrom(deck, 0);

	System.out.println("Dealer's hand: "+dealer.getCard(0).getValue()+"  ?" );
	System.out.println("Your hand: "+player );
	System.out.println("cpu1's hand: "+cpu1 );
	System.out.println("cpu2's hand: "+cpu2 );


	boolean stand1= false;	
	boolean stand2= false;
	boolean stand3= false;

	boolean busted1= false;
	boolean busted2= false;
	while(!stand1||(!stand2&&!busted1)||(!stand3&&!busted2)){
	    if (playerDraw(player)&& !stand1){
		System.out.println("Your hand: "+player );
		if (getFinalVal(player)==21){
		    System.out.println("You got a BLACKJACK");
		}
		System.out.println("HIT or STAND?");
		String choice= Keyboard.readString();
		if (choice.compareTo("hit")==0){
		    System.out.println("You drew a "+deck.getCard(0).getValue()+deck.getCard(0).getFace());
		    player.drawFrom(deck, 0);
		    if(getFinalVal(player)>21){
			System.out.println("BUST");
			System.out.println("GAME OVER");
			return;
		    }else if(getFinalVal(player)==21){
			System.out.println("You got a BACKJACK");
			stand1=true;
		    }
		}else {
		    System.out.println("You STAND");
		    stand1= true;
		}
	    }
	    System.out.println("Your hand: "+player );
	
	    if(cpu1Draw(cpu1)){
		System.out.println("cpu1 drew a "+deck.getCard(0).getValue()+deck.getCard(0).getFace());
		cpu1.drawFrom(deck, 0);
		if(getFinalVal(cpu1)>21){
		    System.out.println("cpu1 BUSTED");
		    busted1= true;
		}else if(getFinalVal(cpu1)==21){
		    System.out.println("cpu1 got a BACKJACK");
		    stand2= true;
		}
	    }else if (!stand2&& !busted1){
		if (getFinalVal(cpu1)==21){
		    System.out.println("cpu1 has a BLACKJACK");
		}
		System.out.println("cpu1 STANDS" );
		stand2=true;
	    }
	    System.out.println("cpu1's hand: "+cpu1 );


	    if(cpu2Draw(cpu2)){
		System.out.println("cpu2 drew a "+deck.getCard(0).getValue()+deck.getCard(0).getFace());
		cpu2.drawFrom(deck, 0);
		if(getFinalVal(cpu2)>21){
		    System.out.println("cpu2 BUSTED");
		    busted2= true;
		}else if(getFinalVal(cpu2)==21){
		    System.out.println("cpu2 got a BACKJACK");
		    stand3=true;
		}
	    }else if (!stand3&&!busted2){
		if (getFinalVal(cpu1)==21){
		    System.out.println("cpu1 has a BLACKJACK");
		}
		System.out.println("cpu2 STANDS");
		stand3= true;
	    }
	    System.out.println("cpu2's hand: "+cpu2 );
	
	}//end while loop

	System.out.println("Dealer reveals her hand");
	System.out.println(dealer);
	while(dealerDraw(dealer)){
	    System.out.println("dealer drew a "+deck.getCard(0).getValue()+deck.getCard(0).getFace());
	    dealer.drawFrom(deck, 0);
	}

	if(getFinalVal(dealer)>21){
	    System.out.println("Dealer BUSTED");
	    if(getFinalVal(cpu1)<= 21)
		System.out.println("cpu1 won");
	    if(getFinalVal(cpu2)<= 21)
		System.out.println("cpu2 won");
	    System.out.println("YOU WON");
	    return;
	}else if(getFinalVal(dealer)==21){
	    System.out.println("dealer got a BACKJACK");
	}else{
	    System.out.println("dealer STANDS");
	}
    
	System.out.println("Dealer's total is "+getFinalVal(dealer));
	System.out.println("cpu1's total is "+getFinalVal(cpu1));
	System.out.println("cpu2's total is "+getFinalVal(cpu2));
	System.out.println("Your total is "+getFinalVal(player));

	if(busted1||getFinalVal(cpu1)< getFinalVal(dealer)){
	    System.out.println("cpu1 lost");
	}else if (getFinalVal(cpu1)== getFinalVal(dealer)){
	    System.out.println("cpu1 PUSHED");
	}else if (getFinalVal(cpu1)> getFinalVal(dealer)){
	    System.out.println("cpu1 WON");
	}

	if(busted2|| getFinalVal(cpu2)< getFinalVal(dealer)){
	    System.out.println("cpu2 lost");
	}else if (getFinalVal(cpu2)== getFinalVal(dealer)){
	    System.out.println("cpu2 PUSHED");
	}else if (getFinalVal(cpu2)> getFinalVal(dealer)){
	    System.out.println("cpu2 WON");
	}

	if(getFinalVal(player)< getFinalVal(dealer)){
	    System.out.println("You lost\n GAME OVER");
	}else if (getFinalVal(player)== getFinalVal(dealer)){
	    System.out.println("You were PUSHED");
	}else if (getFinalVal(player)> getFinalVal(dealer)){
	    System.out.println("You WON");
	}
    
    }
		
}

