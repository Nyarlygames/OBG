package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author ...
	 */
	public class UI extends FlxSprite 
	{
		
		public var scoret:FlxText;
		public var viest:FlxText;
		public var niveaut:FlxText;
		public var level:Play;
		
		public function UI(play:Play) 
		{
			level = play;
			// UI
			super(0, 0)
			makeGraphic(FlxG.width, FlxG.height / 20, 0xaa4E4F4D, true);
			scoret = new FlxText(20 , 0, FlxG.width /4, "");
			scoret.setFormat(null, 16, 0xADAEAC);
			niveaut = new FlxText(FlxG.width /4 ,0, FlxG.width /4, "");
			niveaut.setFormat(null, 16, 0xADAEAC);
			viest = new FlxText(FlxG.width * 2 / 4, 0 , FlxG.width * 2 /4, "");
			viest.setFormat(null, 16, 0xADAEAC);
		}
		
		override public function update():void {
			
			// TEXTES
			viest.text = "Vies : " + level.ship.life.toString();
			scoret.text = "Score : " + level.ship.score;
			niveaut.text = "Niveau : " + level.level;
			
		}
	}

}