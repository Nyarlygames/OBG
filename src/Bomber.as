package  
{
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxSprite;
	/**
	 * Ennemis Bomber
	 * @author ...
	 */
	public class Bomber extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/bomber.png')] public var ImgBomber:Class;
		[Embed(source = '../assets/gfx/tir3.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class; 
		
		
		public function Bomber(vie:int, x:int, y:int, ship:Ship) 
		{
			super(x, y, ImgBomber, vie, ship);
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/tir.mp3", false, true);
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(150);
			shoot.setBulletSpeed(200);
		}
		
		override public function behave():void {
		}
		
		override public function mort():FlxSprite {
			if (health == 0) {
				pv.exists = false;
				var explosion:FlxSprite = new FlxSprite(x, y)
				explosion.loadGraphic(Explode, true, false, 256, 128);
				explosion.addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 15, true);
				explosion.exists = false;
				explosion.x = x - explosion.frameWidth/2 + frameWidth /2;
				explosion.y = y - explosion.frameHeight/2 + frameHeight /2;
				explosion.exists = true;
				explosion.play("explode");
				this.exists = false;
				return(explosion);
			}
			return(null);
		}
		
	}

}