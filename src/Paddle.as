package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	
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
		}
		
		override public function update():void
		{
			// GESTION TOUCHES APPUYEES
			if (FlxG.keys.pressed("LEFT")) {
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
			}
		}
		
	}

}