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
		
		[Embed(source = '../assets/gfx/hitbox2.png')] public var ImgHitbox:Class;
		public var player:Ship;
		
		public function Hitbox(ship:Ship) 
		{
			player = ship;
			super(ship.x , ship.y, ImgHitbox);
		}
		
		override public function update():void {
			this.x = player.x;
			this.y = player.y;
			angle = player.angle;
		}
	}

}