package  
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	import org.flixel.FlxText;
	import org.flixel.system.input.Input;
	
	/**
	 * Menu Options
	 * @author ...
	 */
	public class PickAdn extends FlxState 
	{
		public var choose_seed:FlxText;
		public var seed1:FlxText = new FlxText(FlxG.width / 2, FlxG.height *3/ 15 , FlxG.width, "");
		public var seed2:FlxText = new FlxText(FlxG.width / 2, FlxG.height *5/ 15 , FlxG.width, "");
		public var seeds:int = 1;
		public var adn:Array = new Array("T", "A", "G", "C");
		public var game:Game;
		public var adns:FlxPoint = new FlxPoint(0,0);
		public var img_player:FlxSprite;
		public var reg:ImgRegistry = new ImgRegistry();
		
		public function PickAdn(jeu:Game) 
		{          
			game = jeu;
			seed1.setFormat(null, 16, 0xADAEAC);
			seed2.setFormat(null, 16, 0xADAEAC);
			choose_seed = new FlxText(FlxG.width / 2 - 100, FlxG.height / 15 , FlxG.width, "Type a seed...");
			choose_seed.setFormat(null, 16, 0xADAEAC);
			add(choose_seed);
			add(seed1);
			add(seed2);
			img_player = new FlxSprite(0, 0, reg.assets[(adns.x % reg.adncount) + reg.adnindex]);
			add(img_player);
			
		}
		
		override public function update():void {
			super.update();
			img_player.loadGraphic(reg.assets[(adns.x % reg.adncount) + reg.adnindex]);
			if (FlxG.keys.justReleased("BACKSPACE")) {
				if ((seeds == 1) && (seed1.text.length > 0)) {
					adns.x -= int(seed1.text.toString().charCodeAt(seed1.text.length -1));
					seed1.text = seed1.text.substr(0, seed1.text.length - 1);
				}
				if ((seeds == 2) && (seed2.text.length > 0)) {
					adns.y -= int(seed2.text.toString().charCodeAt(seed2.text.length -1));
					seed2.text = seed2.text.substr(0, seed2.text.length - 1);
				}
			}
			else if (FlxG.keys.justReleased("ENTER")) {
				if (seeds == 1)
					seeds = 2; // choix seed 2
				else {
					game.onstate = false;
					exists = false;
				}
			}
			else if (FlxG.keys.justReleased("ESCAPE")) {
				if (seeds == 2)
					seeds = 1;
				else
					FlxG.switchState(new Menu());
			}
			else if (FlxG.keys.justReleasedAny() > -1 ) {
				if ((seeds == 1) && (seed1.text.length < 16)) {
					if (String.fromCharCode((FlxG.keys.justReleasedAny() - 1)) == "G") {
						seed1.text += "G";
					}
					else
						seed1.text += adn[((FlxG.keys.justReleasedAny() - 1) % 4)];
					adns.x += int(seed1.text.toString().charCodeAt(seed1.text.length -1));
				}
				if ((seeds == 2) && (seed2.text.length < 16)) {
					if (String.fromCharCode((FlxG.keys.justReleasedAny() - 1)) == "G") {
						seed2.text += "G";
					}
					else
						seed2.text += adn[((FlxG.keys.justReleasedAny() - 1) % 4)];
					adns.y += int(seed2.text.toString().charCodeAt(seed2.text.length -1));
				}
			}
		}
	}

}