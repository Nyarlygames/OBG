package  
{
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	/**
	 * Ennemis Bomber
	 * @author ...
	 */
	public class Bomber extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/bomber.png')] public var ImgBomber:Class;
		[Embed(source = '../assets/gfx/tir3.png')] public var ImgShoot:Class;
		
		
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
		
	}

}