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
			//FlxScrollZone.add(this, new Rectangle(0, 0, this.width, this.height), 0, -2, false);
		}
		
		
		override public function update():void
		{
			velocity.y = -50;
			//trace(FlxScrollZone.getDrawMatrix(this, 0));
		}
		
		override public function destroy():void
		{
			//FlxScrollZone.clear();
		}
	}

}