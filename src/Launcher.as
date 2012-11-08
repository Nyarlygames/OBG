package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * BONUS LAUNCHER
	 * @author ...
	 */
	public class Launcher extends FlxSprite 
	{		
		[Embed(source = '../assets/gfx/shootem.png')] protected var ImgShoot:Class;
		public var shootwidth:int = 30;
		public var shootheight:int = 23;
		
		public function Launcher(xPos:int, yPos:int) 
		{
			super(xPos, yPos, ImgShoot);			
		}
		
	}

}