package
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	 
	/**
	 * Menu state
	 * @author 
	 */
	public class MenuState extends FlxState
	{
		
		/**
		 * Create the menu state
		 */
		override public function create():void
		{
			
			FlxG.bgColor = 0xaa519CCA;
			var title:FlxText = new FlxText(FlxG.width / 2 - 50, FlxG.height / 2 - 200, 100, "SALUT !");
			title.setFormat(null, 16, 0x044071);
			add(title);

			var instruction:FlxText = new FlxText(FlxG.width / 2 - 100, FlxG.height / 2 + 100, 200, "- \"Espace\" pour commencer");
			instruction.setFormat(null, 12, 0x044071);
			add(instruction);
			var instruction2:FlxText = new FlxText(FlxG.width / 2 - 100, FlxG.height / 2 + 150, 200, "- \"Espace\" pour lancer la boule");
			instruction2.setFormat(null, 12, 0x044071);
			add(instruction2);
			var instruction3:FlxText = new FlxText(FlxG.width / 2 - 100, FlxG.height / 2 + 200, 200, "- \"N\" pour les missiles");
			instruction3.setFormat(null, 12, 0x044071);
			add(instruction3);
			
			var name:FlxText = new FlxText(FlxG.width - 100, FlxG.height - 80, 200, "Paul Fiat");
			name.setFormat(null, 12, 0x044071);
			add(name);
		}
		
		/**
		 * Update the state
		 */
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.pressed("SPACE")) {
				FlxG.switchState(new PlayState());
			}
		}
	}
}
