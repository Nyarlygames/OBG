package  
{
	import org.flixel.FlxSprite;
	
	/**
	 * BLOCS
	 * @author ...
	 */
	public class Block extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/block.png')] protected var ImgBlock:Class;

	
		public function Block(xPos:int, yPos:int) 
		{
			super(xPos, yPos, ImgBlock);	
			immovable = true;
		}
		
	}

}