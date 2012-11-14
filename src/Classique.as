package  
{
	
	import org.flixel.FlxSound;
	
	/**
	 * Ennemis de base
	 * @author ...
	 */
	public class Classique extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgClassic:Class;
		[Embed(source = '../assets/gfx/tir.png')] public var ImgShoot:Class;
		
		public function Classique(vie:int, x:int, y:int) 
		{
			super(x, y, ImgClassic, vie);
			trace(sound);
			//sound.loadStream("../assets/sfx/tir.mp3", false, true);
			trace(sound);
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(10);
			shoot.setBulletSpeed(300);
		}
		
	}

}