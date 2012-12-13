package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	
	/**
	 * Game
	 * @author ...
	 */
	public class Game extends FlxState 
	{
		public var pickadn:PickAdn;
		public var play:Play;
		public var keys:KeyEvent;
		public var cursor:Cursor;
		public var state:int = 1;
		public var onstate:Boolean = true;
		/*
		 * 1 = Choix de l'adn
		 * 2 = Premier niveau
		 * 3 = 
		 * ...
		 * Ecran de scoring
		 * Event
		 * Boss
		*/
		
		public function Game() 
		{
			pickadn = new PickAdn(this);
			add(pickadn);
		}
		
		override public function update():void {
			
			super.update();
			if ((state == 1) && (onstate == false)) {
				play = new Play();
				keys = new KeyEvent(play.ship);
				cursor = new Cursor(play.area, play.ship);
				add(play);
				add(cursor);
				add(keys);
				state = 2;
				onstate = true;
			}
		}
		
	}

}