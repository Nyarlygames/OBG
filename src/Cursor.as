package  
{
	import org.flixel.FlxSprite;
	
	import org.flixel.FlxG;
	
	/**
	 * BALLE
	 * @author ...
	 */
	public class Cursor extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/cursor.png')] public var ImgCursor:Class;

		public var surwidth:int = 29;
		public var curheight:int = 27;
		
		public function Cursor() 
		{
			super(FlxG.mouse.x , FlxG.mouse.y, ImgCursor);
		}
		
	}

}