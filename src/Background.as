package  
{
	
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import org.flixel.FlxG;
	import flash.geom.Rectangle
	
	/**
	 * Scrollzone
	 * @author ...
	 */
	public class Background extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/bg.png')] public var ImgBG:Class;
		
		public function Background() 
		{
			super(0, 0, ImgBG);
			velocity.y = -30;
			//FlxScrollZone.add(this, new Rectangle(0, 0, this.frameWidth, this.frameHeight), 0, -150);
			//FlxScrollZone.createZone(this, new Rectangle(241, 16, 46, 46), 0, -150);
		}
		
	}

}