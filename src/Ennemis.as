package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ennemis extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgEnnemis:Class;
		public var pv:int = 100;
		
		public function Ennemis() 
		{
			super(FlxG.width / 2, FlxG.height - 100, ImgEnnemis);
			immovable = true;
		}
		
	}

}