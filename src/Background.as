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
		[Embed(source = '../assets/gfx/borders.png')] public var ImgBorders:Class;
		public var bgspeed:int = 1;
		public var borders:FlxSprite;
		
		public function Background() 
		{
			super(0, 0, ImgBG);
			borders = new FlxSprite(0, 0, ImgBorders);
			//FlxScrollZone.add(this, new Rectangle(0, 0, this.width, this.height), 0, -2, false);
		}
		
		
		override public function update():void
		{
			borders.velocity.y = -50;
			velocity.y = -50;
			//trace(FlxScrollZone.getDrawMatrix(this, 0));
		}
		
		override public function destroy():void
		{
			//FlxScrollZone.clear();
		}
	}

}