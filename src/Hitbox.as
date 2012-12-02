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
		public var player:Ship;
		
		public function Hitbox(ship:Ship) 
		{
			player = ship;
			super(ship.x - ship.frameWidth / 2, ship.y - ship.frameHeight / 2, ImgHitbox);
		}
		
		override public function update():void {
			this.x = player.x - (this.frameWidth - player.frameWidth)/2;
			this.y = player.y - (this.frameHeight - player.frameHeight)/2;
		}
	}

}