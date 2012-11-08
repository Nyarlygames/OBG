package  
{
	import org.flixel.FlxSprite;
	
	import org.flixel.FlxG;
	
	/**
	 * Zone de blocage
	 * @author ...
	 */
	public class Area extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/area.png')] public var ImgArea:Class;

		
		public function Area(ship:Ship) 
		{
			super(ship.x - ship.frameWidth / 2, ship.y - ship.frameHeight / 2, ImgArea);
		}
		
		public function sticktoship(ship:Ship):void {
			this.x = ship.x - (this.frameWidth - ship.frameWidth)/2;
			this.y = ship.y - (this.frameHeight - ship.frameHeight)/2;
		}
		
	}

}