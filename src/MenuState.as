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
	 
	/**
	 * Menu state
	 * @author 
	 */
	public class MenuState extends FlxState
	{
		public var title:FlxText = new FlxText(FlxG.width / 2 - 50, FlxG.height / 2 - 200, 100, "Yet Another Shoot'em Up");
		public var start:FlxSprite;
		public var quit:FlxSprite;
		public var opts:FlxSprite;
		[Embed(source = '../assets/gfx/quitter.png')] public var ImgQuit:Class;
		[Embed(source = '../assets/gfx/options.png')] public var ImgOpts:Class;
		[Embed(source = '../assets/gfx/demarrer.png')] public var ImgStart:Class;
		[Embed(source = '../assets/gfx/quittere.png')] public var ImgQuite:Class;
		[Embed(source = '../assets/gfx/optionse.png')] public var ImgOptse:Class;
		[Embed(source = '../assets/gfx/demarrere.png')] public var ImgStarte:Class;
		public var optse:Ennemis;
		public var quite:Ennemis;
		public var starte:Ennemis;
		public var os:FlxPoint = new FlxPoint();
		public var ship:Ship = new Ship();
		public var cur:Cursor = new Cursor();
		public var area:Area = new Area(ship);
		public var ens:FlxGroup = new FlxGroup();
		public var dmg:int = 1;
		
		/**
		 * Create the menu state
		 */
		override public function create():void
		{
			
			FlxG.bgColor = 0xaa4E4F4D;
			os.x = 200;
			os.y = 50;
			// Ajout ennemis et titres
			start = new FlxSprite(FlxG.width / 3 -os.x, FlxG.height /2, ImgStart);
			quit = new FlxSprite(FlxG.width-os.x, FlxG.height /2, ImgQuit);
			opts = new FlxSprite(FlxG.width * 2 / 3 -os.x, FlxG.height /2, ImgOpts);
			optse = new Ennemis(FlxG.width * 2/ 3 -os.x, FlxG.height /2 +os.y, ImgOptse, 20);
			starte = new Ennemis(FlxG.width / 3 -os.x, FlxG.height /2 +os.y, ImgStarte, 20);
			quite = new Ennemis(FlxG.width - os.x, FlxG.height / 2 +os.y, ImgQuite, 20);
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
			ship.moveship(area, cur);
			ship.shoot.fireAtMouse();
			
			FlxG.overlap(ship.shoot.group, ens, hit);
			
			// Suivis vie des choix
			for each (var op:Ennemis in ens.members) {
				if ((op != null) && (op.exists == false)){
					if (op.x == quite.x)
						System.exit(0);
					else if (op.x == optse.x)
						FlxG.switchState(new Options());
						else if (op.x == starte.x)
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
