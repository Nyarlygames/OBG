package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * Ship
	 * @author ...
	 */
	public class Ship extends FlxSprite 
	{
		
		public var pv:int = 100;
		[Embed(source = '../assets/gfx/ship.png')] public var ImgShip:Class;
		
		public function Ship() 
		{
			super(FlxG.width / 2, 100, ImgShip);
			immovable = true;
		}
	}

}