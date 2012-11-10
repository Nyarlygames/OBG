package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * Hitbox
	 * @author ...
	 */
	public class Hitbox extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/hitbox.png')] public var ImgHitbox:Class;
		public function Hitbox(ship:Ship) 
		{
			super(ship.x - ship.frameWidth / 2, ship.y - ship.frameHeight / 2, ImgHitbox);
		}
		
		public function sticktoship(ship:Ship):void {
			this.x = ship.x - (this.frameWidth - ship.frameWidth)/2;
			this.y = ship.y - (this.frameHeight - ship.frameHeight)/2;
		}
	}

}