package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxSound;
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Ennemis extends FlxSprite 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgEnnemis:Class;
		public var sound:FlxSound;
		public var pv:FlxBar;
		public var to:FlxPoint = new FlxPoint();
		public var tirs:FlxGroup;
		public var maxtir:int = 10;

		public function Ennemis() 
		{
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/tir.mp3", false, true);
			super(FlxG.width / 2, FlxG.height -100, ImgEnnemis);
			immovable = true;
			health = 100;
			pv = new FlxBar(16, 64, FlxBar.FILL_LEFT_TO_RIGHT, 64, 4, this, "health");
			pv.trackParent(0, -10);
			tirs = new FlxGroup();
		}
		
		public function mort():void {
			if (health == 0) {
				exists = false;
				pv.exists = false;
			}
		}
		
		
		// Gestion des balles pour performances
		public function recycletirs(ship:Ship):void {
			if (alive == true) {
				for each (var tir:Tir in tirs.members) {
					if ((tir != null) && ((tir.x > FlxG.width) || (tir.y > FlxG.height) || 
							(tir.x < 0) || (tir.y < 0))) {
							tir.exists = false;
					}
				}
				if (tirs.length < maxtir) {
					var newtir:Tir = new Tir(this, ship);
					tirs.add(newtir);
				}
				else {
					var recycle:Tir =  tirs.getFirstAvailable() as Tir;
					if (recycle != null)
						recycle.updatetir(this, ship);
				}
			}
		}
	}

}