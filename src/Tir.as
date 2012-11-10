package  
{
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Tir extends FlxSprite 
	{			
		[Embed(source = '../assets/gfx/tir.png')] protected var ImgTir:Class;
		public var tirwidth:int = 90;
		public var tirheight:int = 90;
		public var missilenum:int = 30;
		public var xpos:int = 0;
		public var ypos:int = 0;
		
		public function Tir(ship:Ship) 
		{
			var tox:int = FlxG.mouse.x - (ship.x+ship.frameWidth/2);
			var toy:int = FlxG.mouse.y - (ship.y+ship.frameHeight/2);
			super(ship.x + ship.frameWidth / 2, ship.y + ship.frameHeight / 2, ImgTir);
			maxVelocity.x = 700;
			maxVelocity.y = 700;
			acceleration.x = tox;
			acceleration.y = toy;
			velocity.x = tox;
			velocity.y = toy;
			exists = true;
		}
		
		public function updatetir(ship:Ship):void {
			var tox:int = FlxG.mouse.x - (ship.x+ship.frameWidth/2);
			var toy:int = FlxG.mouse.y - (ship.y+ship.frameHeight/2);
			x = ship.x + ship.frameWidth/2;
			y = ship.y + ship.frameHeight / 2;
			acceleration.x = tox;
			acceleration.y = toy;
			velocity.x = tox;
			velocity.y = toy;
			exists = true;
		}
	}

}