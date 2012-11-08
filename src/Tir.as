package  
{
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG
	
	/**
	 * ...
	 * @author ...
	 */
	public class Tir extends FlxSprite 
	{			
		[Embed(source = '../assets/gfx/tir.png')] protected var ImgTir:Class;
		public var tirwidth:int = 5;
		public var tirheight:int = 5;
		public var missilenum:int = 30;
		public var xpos:int = 0;
		public var ypos:int = 0;
		
		public function Tir(pad:Paddle) 
		{
			var tox:int = FlxG.mouse.x - (this.x + tirwidth / 2) - FlxG.width/2;
			var toy:int = FlxG.mouse.y - (this.y + tirheight / 2) - FlxG.height / 2;
			xpos = pad.x + pad.padwidth / 2;
			ypos = pad.y + pad.padheight / 2;
			super(xpos, ypos, ImgTir);	
			maxVelocity.x = 700;
			maxVelocity.y = 700;
			acceleration.x = tox;
			acceleration.y = toy;
			velocity.x = tox;
			velocity.y = toy;
			trace(FlxG.mouse.screenX);
			trace (xpos);
			trace (tox);
			
			trace (velocity.x);
		}
		
	}

}