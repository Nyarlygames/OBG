package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.system.input.Mouse;
	
	/**
	 * PADDLE
	 * @author ...
	 */
	public class Ship extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/ship.png')] public var ImgShip:Class;
		
		public var shipwidth:int = 90;
		public var shipheight:int = 90;
		public var xpos:int = 0;
		public var ypox:int = 0;
 
		public function Ship() 
		{
			super(FlxG.width / 2, FlxG.height - 100, ImgShip);
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
			var tox:int = FlxG.mouse.x - (this.x+shipwidth/2);
			var toy:int = FlxG.mouse.y - (this.y+shipheight/2);
			var os:int = 1;
			var hypo:int = Math.sqrt(tox*tox + toy*toy);
			angle = Math.cos(toy / hypo);
			
			// GAUCHE/DROITE
			if ((tox < -(shipwidth/2)) || (tox > (shipwidth/2)+os)) {
				acceleration.x = tox/2;
			}
			else{
				velocity.x = 0;
				
			}	
			
			// HAUT/BAS
			if ((toy < -(shipheight/2)) || (toy > (shipheight/2)+os)) {
				acceleration.y = toy/2;
			}
			else{
				velocity.y = 0;
				
				}
		}
	}

}