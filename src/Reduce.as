package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * BONUS REDUIRE
	 * @author ...
	 */
	public class Reduce extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/reduce.png')] protected var ImgRed:Class;
		public var redwidth:int = 30;
		public var redheight:int = 23;
		
		public function Reduce(xPos:int, yPos:int) 
		{
			super(xPos, yPos, ImgRed);			
		}
		
	}

}