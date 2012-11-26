package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import flash.system.System;
    import flash.display.StageDisplayState;
    import flash.events.Event;
	
	/**
	 * Menu state
	 * @author 
	 */
	public class MenuState extends FlxState
	{
		public var title:FlxText;
		public var start:FlxSprite;
		public var quit:FlxSprite;
		public var opts:FlxSprite;
		[Embed(source = '../assets/gfx/quitter.png')] public var ImgQuit:Class;
		[Embed(source = '../assets/gfx/options.png')] public var ImgOpts:Class;
		[Embed(source = '../assets/gfx/demarrer.png')] public var ImgStart:Class;
		[Embed(source = '../assets/gfx/quittere.png')] public var ImgQuite:Class;
		[Embed(source = '../assets/gfx/optionse.png')] public var ImgOptse:Class;
		[Embed(source = '../assets/gfx/demarrere.png')] public var ImgStarte:Class;
		public var optse:MenusEnnemis;
		public var quite:MenusEnnemis;
		public var starte:MenusEnnemis;
		public var os:FlxPoint = new FlxPoint();
		public var ship:Ship = new Ship();
		public var cur:Cursor = new Cursor();
		public var area:Area = new Area(ship);
		public var ens:FlxGroup = new FlxGroup();
		public var dmg:int = 1;
		[Embed(source = "../options.cfg", mimeType = "application/octet-stream")] public var configs:Class;
		public var config:Configs = new Configs(configs);
		
		/**
		 * Create the menu state
		 */
		override public function create():void
		{	
			FlxG.stage.displayState = StageDisplayState.FULL_SCREEN;
			FlxG.width = config.width;
			FlxG.height = config.height;
			FlxG.bgColor = 0xaa4E4F4D;
			os.x = 200;
			os.y = 50;
			// Ajout ennemis et titres
			start = new FlxSprite(FlxG.width / 3 -os.x, FlxG.height /2, ImgStart);
			quit = new FlxSprite(FlxG.width-os.x, FlxG.height /2, ImgQuit);
			opts = new FlxSprite(FlxG.width * 2 / 3 -os.x, FlxG.height /2, ImgOpts);
			optse = new MenusEnnemis(FlxG.width * 2/ 3 -os.x, FlxG.height /2 +os.y, ImgOptse, 20, ship);
			starte = new MenusEnnemis(FlxG.width / 3 -os.x, FlxG.height /2 +os.y, ImgStarte, 20, ship);
			quite = new MenusEnnemis(FlxG.width - os.x, FlxG.height / 2 +os.y, ImgQuite, 20, ship);
			title = new FlxText(FlxG.width / 2 - 50, FlxG.height / 2 - 200, 100, "Yet Another Shoot'em Up");;
			quite.x += quite.frameWidth / 2;
			optse.x += optse.frameWidth / 2;
			starte.x += starte.frameWidth / 2;
			ship.shoot.setFireRate(100);
			ens.add(starte);
			ens.add(optse);
			ens.add(quite);
			add(title);
			add(start);
			add(quit);
			add(opts);
			add(starte);
			add(quite);
			add(optse);
			add(starte.pv);
			add(quite.pv);
			add(optse.pv);
			add(area);
			add(ship);
			add(cur);
			add(ship.shoot.group);
			ship.cur = cur;
			ship.area = area;
			title.setFormat(null, 16, 0xADAEAC);
		}
		
		/**
		 * Update the state
		 */
		override public function update():void
		{
			super.update();
			
			// Update textures & texte
			ship.angle = FlxVelocity.angleBetween (ship, cur, true ) +90;
			cur.x = FlxG.mouse.x - cur.frameWidth / 2;
			cur.y = FlxG.mouse.y - cur.frameHeight / 2;
			area.sticktoship(ship);	
			
			// Bouge le vaisseau
			ship.moveship();
			
			FlxG.overlap(ship.shoot.group, ens, hit);
			
			// Suivis vie des choix
			for each (var op:Ennemis in ens.members) {
				if ((op != null) && (op.exists == false)){
					if (op.x == quite.x)
						System.exit(0);
					if (op.x == optse.x)
						FlxG.switchState(new Options());
					if (op.x == starte.x)
						FlxG.switchState(new PlayState());	
					
				}
			}
		}
		
		// TOUCHE ENNEMIS
		private function hit(bullet:FlxObject, target:Ennemis):void
		{
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target as Ennemis))
			{
				target.hurt(dmg);
				target.sound.play();
				bullet.kill();
				target.mort();
			}			
		}
	}
}
