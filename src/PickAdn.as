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
		public var seed1_label:FlxText = new FlxText(FlxG.width / 2 -100, FlxG.height *9/ 15 , FlxG.width, "M");
		public var seed2_label:FlxText = new FlxText(FlxG.width / 2 -100, FlxG.height *10/ 15 , FlxG.width, "F");
		public var seed1:FlxText = new FlxText(FlxG.width / 2, FlxG.height *9/ 15 , FlxG.width, "");
		public var seed2:FlxText = new FlxText(FlxG.width / 2, FlxG.height *10/ 15 , FlxG.width, "");
		public var ask_name:FlxText = new FlxText(FlxG.width / 2, FlxG.height/ 15 , FlxG.width, "What's the name ?");
		public var username:FlxText = new FlxText(FlxG.width / 2, FlxG.height*2/ 15 , FlxG.width, "");
		public var seeds:int = 0;
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
			seed1_label.setFormat(null, 16, 0xADAEAC);
			seed2_label.setFormat(null, 16, 0xADAEAC);
			ask_name.setFormat(null, 16, 0xADAEAC);
			username.setFormat(null, 16, 0xADAEAC);
			choose_seed = new FlxText(FlxG.width / 2 - 100, FlxG.height *7/ 15 , FlxG.width, "Type a seed...");
			choose_seed.setFormat(null, 16, 0xADAEAC);
			add(choose_seed);
			add(seed1);
			add(seed2);
			add(seed1_label);
			add(seed2_label);
			add(ask_name);
			add(username);
			img_player = new FlxSprite(0, FlxG.height/2, reg.assets[(adns.x % reg.adncount) + reg.adnindex]);
			add(img_player);
			
		}
		
		override public function update():void {
			super.update();
			img_player.loadGraphic(reg.assets[(adns.x % reg.adncount) + reg.adnindex]);
			if (FlxG.keys.justReleased("BACKSPACE")) {
				if ((seeds == 0) && (username.text.length > 0)) {
					username.text = username.text.substr(0, username.text.length - 1);
				}
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
				if (seeds < 2)
					seeds++;
				else { 
					game.config.name = username.text;
					game.onstate = false;
					exists = false;
				}
			}
			else if (FlxG.keys.justReleased("ESCAPE")) {
				if (seeds > 0)
					seeds--;
				else
					FlxG.switchState(new Menu());
			}
			else if (FlxG.keys.justReleasedAny() > -1 ) {
				if ((seeds == 0) && (seed2.text.length < 16) && (FlxG.keys.justReleasedAny() > 65) && (FlxG.keys.justReleasedAny() < 91)) {
						username.text += String.fromCharCode((FlxG.keys.justReleasedAny() - 1));
				}
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