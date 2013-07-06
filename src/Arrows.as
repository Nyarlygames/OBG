package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * Arrows
	 * @author ...
	 */
	public class Arrows extends FlxSprite 
	{		
		public function Arrows(x:int, y:int, img:Class) 
		{	
			super(x, y, img);
			immovable = false;
			
		}
	}

}