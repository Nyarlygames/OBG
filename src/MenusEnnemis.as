package  
{
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.FlxSprite;
	/**
	 * Ennemis du menu
	 * @author ...
	 */
	public class MenusEnnemis extends Ennemis 
	{
		
		
		public function MenusEnnemis(x:int, y:int, ImgType:Class, vie:int, ship:Ship) 
		{
			super(x, y, ImgType, vie, ship);
		}
		
	}

}