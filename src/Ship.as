package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.system.input.Mouse;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	
	/**
	 * Ship
	 * @author ...
	 */
	public class Ship extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/ship.png')] public var ImgShip:Class;
		
		public function Ship() 
		{
			super(FlxG.width / 2, FlxG.height - 100, ImgShip);
			immovable = true;
		}
		
		/*
		override public function update():void
		{
		}
		
		public function deplacement():void {
			// Déplacement souris
			FlxG.mouse.show();
			
			var to:FlxPoint = new FlxPoint();
			var here:FlxPoint = new FlxPoint();
			var os:int = 1;
			var aim:Number;
			to.x = FlxG.mouse.x - (this.x + shipwidth/2);
			to.y = FlxG.mouse.y - (this.y + shipheight / 2);
			here.x = this.x;
			here.y = this.y;
			
			aim = FlxU.getAngle(to, here);
		
			trace(aim);
			
			// GAUCHE/DROITE
			if ((to.x < -(shipwidth/2)) || (to.x > (shipwidth/2)+os)) {
				acceleration.x = to.x/2;
			}
			else{
				velocity.x = 0;
				
			}	
			
			// HAUT/BAS
			if ((to.y < -(shipheight/2)) || (to.y > (shipheight/2)+os)) {
				acceleration.y = to.y/2;
			}
			else{
				velocity.y = 0;
				
				}
		}*/
	}

}