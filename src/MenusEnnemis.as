package  
{
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.FlxSprite;
	/**
	 * Ennemis du menu
	 * @author ...
	 */
	public class MenusEnnemis extends Ennemis 
	{
		
		
		public function MenusEnnemis(x:int, y:int, ImgType:Class, vie:int, ship:Ship, move:FlxPoint) 
		{
			super(x, y, ImgType, vie, ship, move);
		}
		
	}

}