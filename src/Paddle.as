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
		
		public var padwidth:int = 90;
		public var padheight:int = 90;
		public var xpos:int = 0;
		public var ypox:int = 0;
 
		public function Paddle() 
		{
			super(FlxG.width / 2, FlxG.height - 100, ImgPaddle);
			immovable = true;
			acceleration.x = 10;
			acceleration.y = 10;
			maxVelocity.x = 200;
			maxVelocity.y = 200;
		}
		
		override public function update():void
		{
			deplacement();
		}
		public function deplacement():void {
			// Déplacement souris
			FlxG.mouse.show();
			var tox:int = FlxG.mouse.x - (this.x+padwidth/2);
			var toy:int = FlxG.mouse.y - (this.y+padheight/2);
			var os:int = 1;
			var hypo:int = Math.sqrt(tox*tox + toy*toy);
			angle = Math.cos(toy / hypo);
			
			// GAUCHE/DROITE
			if ((tox < -(padwidth/2)) || (tox > (padwidth/2)+os)) {
				acceleration.x = tox/2;
			}
			else{
				velocity.x = 0;
				
			}	
			
			// HAUT/BAS
			if ((toy < -(padheight/2)) || (toy > (padheight/2)+os)) {
				acceleration.y = toy/2;
			}
			else{
				velocity.y = 0;
				
				}
		}
	}

}