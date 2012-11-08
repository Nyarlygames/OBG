package  
{
	import org.flixel.FlxSprite;
	
	import org.flixel.FlxG;
	
	/**
	 * BALLE
	 * @author ...
	 */
	public class Ball extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/ball.png')] public var ImgBall:Class;
		[Embed(source = '../assets/gfx/ballred.png')] public var ImgBallred:Class;

		public var spawnballx:int = FlxG.width / 2;
		public var spawnbally:int = FlxG.height - 130;
		public var ballwidth:int = 29;
		public var ballheight:int = 27;
		public function Ball() 
		{
			super(spawnballx , spawnbally -100, ImgBall);			
			velocity.x = 0;
			velocity.y = 0;
			elasticity = 1;	
			// GRIP SUR LE PADDLE
			drag.y = 1;
			drag.x = 1;
		}
		
		override public function update():void {
			
			super.update();
		}
		
	}

}