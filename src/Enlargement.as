package  
{
	import org.flixel.FlxSprite;
	
	import org.flixel.FlxG;
	
	/**
	 * BONUS GROSSIR
	 * @author ...
	 */
	public class Enlargement extends FlxSprite  
	{
		[Embed(source = '../assets/gfx/enlargement.png')] protected var ImgEnl:Class;
		public var enlwidth:int = 30;
		public var enlheight:int = 23;
		
		public function Enlargement(xPos:int, yPos:int) 
		{
			super(xPos, yPos, ImgEnl);
		}
		
	}

}