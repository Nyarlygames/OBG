package  
{
	import org.flixel.FlxSprite;
	
	import org.flixel.FlxG;
	
	/**
	 * Curseur
	 * @author ...
	 */
	public class Cursor extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/cursor.png')] public var ImgCursor:Class;
		
		public function Cursor() 
		{
			super(FlxG.mouse.x , FlxG.mouse.y, ImgCursor);
		}
		
	}

}