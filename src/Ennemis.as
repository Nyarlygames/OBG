package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ennemis extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgEnnemis:Class;
		public var sound:FlxSound;

		public function Ennemis() 
		{
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/tir.mp3", false, true);
			super(FlxG.width / 2, FlxG.height -100, ImgEnnemis);
			immovable = true;
			health = 100;
		}
		
	}

}