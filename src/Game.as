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
		
		public function Game() 
		{
			super.update();
			play = new Play();
			keys = new KeyEvent(play.ship);
			add(keys);
			add(play);
		}
		
	}

}