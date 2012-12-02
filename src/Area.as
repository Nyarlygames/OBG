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
		public var player:Ship;
		
		public function Area(ship:Ship) 
		{
			player = ship;
			super(ship.x - ship.frameWidth / 2, ship.y - ship.frameHeight / 2, ImgArea);
		}
		
		override public function update():void {
			this.x = player.x - (this.frameWidth - player.frameWidth)/2;
			this.y = player.y - (this.frameHeight - player.frameHeight)/2;
		}
		
	}

}