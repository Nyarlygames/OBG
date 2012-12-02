package  
{
	import org.flixel.FlxState;
	
	/**
	 * Game
	 * @author ...
	 */
	public class Game extends FlxState 
	{
		public var play:Play;
		public var keys:KeyEvent;
		public var cursor:Cursor;
		
		public function Game() 
		{
			super.update();
			play = new Play();
			keys = new KeyEvent(play.ship);
			cursor = new Cursor(play.area, play.ship);
			add(play);
			add(cursor);
			add(keys);
		}
		
	}

}