package  
{
	
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	
	/**
	 * Ennemis de base
	 * @author ...
	 */
	public class Classique extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgClassic:Class;
		[Embed(source = '../assets/gfx/tir.png')] public var ImgShoot:Class;
		private var timer:FlxDelay = new FlxDelay(3500);
		
		public function Classique(vie:int, x:int, y:int, ship:Ship) 
		{
			super(x, y, ImgClassic, vie, ship);
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/tir.mp3", false, true);
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(10);
			shoot.setBulletSpeed(300);
			timer.start();
		}
		
		override public function behave():void {
			var back:FlxPoint = new FlxPoint;
			if (timer.hasExpired)
			{
				back.x = this.x;
				back.y = FlxG.height + this.frameHeight + 50;
				FlxVelocity.moveTowardsPoint(this,back,150);
			}
			else {
				back.x = this.x;
				back.y = FlxG.height * 3 / 5;
				FlxVelocity.moveTowardsPoint(this, back, 1, 3000);
			}
		}
	}

}