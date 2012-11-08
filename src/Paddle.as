package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.system.input.Mouse;
	
	/**
	 * PADDLE
	 * @author ...
	 */
	public class Paddle extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/paddle.png')] public var ImgPaddle:Class;
		[Embed(source = '../assets/gfx/paddleenl.png')] public var ImgPaddleenl:Class;
		
		public var padwidth:int = 150;
		public var padheight:int = 20;
 
		public function Paddle() 
		{
			super(FlxG.width / 2, FlxG.height - 100, ImgPaddle);
			immovable = true;
			acceleration.x = 10;
			acceleration.y = 10;
			maxVelocity.x = 100;
			maxVelocity.y = 100;
		}
		
		override public function update():void
		{
			deplacement();
		}
		public function deplacement():void {
			// GESTION TOUCHES APPUYEES
			trace(FlxG.mouse.screenX);
			trace(FlxG.mouse.x);
			FlxG.mouse.show();
			var tox:int = FlxG.mouse.x - this.x;
			var toy:int = FlxG.mouse.y - this.y;
			acceleration.x = tox;
			acceleration.y = toy;
			
			/*if (FlxG.mouse.pressed("LEFT")) {
				if (this.x > 0)
					velocity.x = -300;
				else
					velocity.x = 0;
			}
			if (FlxG.keys.pressed("RIGHT"))  {
				if (this.x < FlxG.width - padwidth)
					velocity.x = 300;
				else
					velocity.x = 0;
			}
			
			// GESTION TOUCHES RELACHEES
			if (FlxG.keys.justReleased("LEFT")) {
				velocity.x = 0;
			}
			
			if (FlxG.keys.justReleased("RIGHT")) {
				velocity.x = 0;	
			}*/
		}
		
	}

}