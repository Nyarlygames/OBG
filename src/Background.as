package  
{
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	
	/**
	 * Scrollzone
	 * @author ...
	 */
	public class Background extends FlxScrollZone 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgBG:Class;
		
		public function Background() 
		{
			super(0, 0, ImgBG);
			immovable = true;
		}
		
	}

}