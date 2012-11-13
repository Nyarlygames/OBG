package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	/**
	 * Ennemis
	 * @author ...
	 */
	
	public class Ennemis extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/tir.png')] public var ImgShoot:Class;
		public var sound:FlxSound;
		public var to:FlxPoint;
		public var pv:FlxBar;
		public var maxtir:int = 20;
		public var shoot:FlxWeapon;

		public function Ennemis(x:int, y:int, ImgType:Class, vie:int) 
		{
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/tir.mp3", false, true);
			super(x, y, ImgType);
			immovable = true;
			health = vie;
			pv = new FlxBar(16, 64, FlxBar.FILL_LEFT_TO_RIGHT, 64, 4, this, "health",0 ,health);
			pv.trackParent(0, -10);
			shoot = new FlxWeapon("shoot", this, "x", "y");
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(10);
			shoot.setBulletSpeed(300);
		}
		
		// Mort du vaisseau
		public function mort():void {
			if (health == 0) {
				pv.exists = false;
				this.exists = false;
			}
		}
	}

}