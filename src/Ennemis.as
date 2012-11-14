package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxSound;
	
	/**
	 * Ennemis
	 * @author ...
	 */
	
	public class Ennemis extends FlxSprite 
	{
		public var to:FlxPoint;
		public var pv:FlxBar;
		public var maxtir:int = 20;
		public var shoot:FlxWeapon;
		public var sound:FlxSound;

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