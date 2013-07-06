package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSave;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import flash.system.System;
	/**
	 * Menu state
	 * @author 
	 */
	public class Menu extends FlxState
	{
		public var title:FlxText;
		public var keyt:FlxText;
		public var start:FlxSprite;
		public var quit:FlxSprite;
		public var opts:FlxSprite;
		public var optse:MenusEnnemis;
		public var quite:MenusEnnemis;
		public var starte:MenusEnnemis;
		public var os:FlxPoint = new FlxPoint();
		public var ship:Ship = new Ship();
		public var cur:Cursor;
		public var area:Area = new Area(ship);
		public var ens:FlxGroup = new FlxGroup();
		public var dmg:int = 1;
		public var config:Configs = new Configs();
		public var keys:KeyEvent;
		public var reg:ImgRegistry = new ImgRegistry();
		
		/**
		 * Create the menu state
		 */
		override public function create():void
		{
			//[Embed(source = '../assets/fonts/Colleged.ttf',	fontFamily = "fontFamily", embedAsCFF = "false")] protected var	Font:Class;
			FlxG.bgColor = 0xaa4E4F4D;
			os.x = 200;
			os.y = 50;
			// Ajout ennemis et titres
			start = new FlxSprite(FlxG.width / 3 -os.x, FlxG.height /2, reg.assets[4]);
			quit = new FlxSprite(FlxG.width-os.x, FlxG.height /2, reg.assets[0]);
			opts = new FlxSprite(FlxG.width * 2 / 3 -os.x, FlxG.height /2, reg.assets[2]);
			title = new FlxText(FlxG.width / 2 - 100, FlxG.height / 15 , FlxG.width, "Let's make a baby together");
			
			keyt = new FlxText(FlxG.width / 2 - 300, 2* FlxG.height / 15 , FlxG.width, "Q/LEFT pour orienter à gauche, D/DROIT pour orienter à droite.");
			ship.shoot.setFireRate(100);
			add(title);
			add(keyt);
			add(start);
			add(quit);
			add(opts);
			add(area);
			add(ship);
			cur = new Cursor(area, ship);
			add(cur);
			add(ship.shoot.group);
			ship.area = area;
			optse = new MenusEnnemis(FlxG.width * 2/ 3 -os.x, FlxG.height /2 +os.y, reg.assets[3], 20, ship, new FlxPoint(0,0));
			starte = new MenusEnnemis(FlxG.width / 3 -os.x, FlxG.height /2 +os.y, reg.assets[5], 20, ship, new FlxPoint(0,0));
			quite = new MenusEnnemis(FlxG.width - os.x, FlxG.height / 2 +os.y, reg.assets[1], 20, ship, new FlxPoint(0,0));
			optse.x += optse.frameWidth / 2;
			starte.x += starte.frameWidth / 2;
			ens.add(starte);
			ens.add(optse);
			ens.add(quite);
			add(starte.pv);
			add(quite.pv);
			add(optse.pv);
			add(starte);
			add(quite);
			add(optse);
			title.setFormat(null, 16, 0xADAEAC);
			keyt.setFormat(null, 16, 0xADAEAC);
			keys = new KeyEvent(ship);
			add(keys);
		}
		
		/**
		 * Update the state
		 */
		override public function update():void
		{
			super.update();
			
			FlxG.overlap(ship.shoot.group, ens, hit);

			// Suivis vie des choix
			for each (var op:Ennemis in ens.members) {
				if ((op != null) && (op.exists == false)){
					if (op.x == quite.x)
						System.exit(0);
					if (op.x == optse.x)
						FlxG.switchState(new Options());
					if (op.x == starte.x) {
						FlxG.switchState(new Game());
					}
				}
			}
			
		}
		
		// TOUCHE ENNEMIS
		private function hit(bullet:FlxObject, target:Ennemis):void
		{
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target as Ennemis))
			{
				target.hurt(dmg);
				bullet.kill();
				target.mort();
			}			
		}
	}
}
