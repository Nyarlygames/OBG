package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * MISSILES
	 * @author ...
	 */
	public class Missile extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/missile.png')] protected var ImgMissile:Class;
		public var missilewidth:int = 18;
		public var missileheight:int = 30;
		public var missilenum:int = 30;
		
		public function Missile(xPos:int, yPos:int) 
		{
			super(xPos, yPos, ImgMissile);	
			velocity.x = 0;
			velocity.y = -300;
		}
		
	}

}