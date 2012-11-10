package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxBar;

	/**
	 * Main game play state
	 * @author 
	 */
	public class PlayState extends FlxState
	{	
		// VARIABLES DE PLAYSTATE
		public var ship:Ship;
		public var area:Area;
		public var hb:Hitbox;
		public var ens:FlxGroup = new FlxGroup();
		public var ships:FlxGroup = new FlxGroup();
		public var en:Ennemis = new Ennemis();
		public var dmg:int = 1;
		public var time:FlxText;
		public var cur:Cursor = new Cursor();
		public var bg:Background = new Background();
		
		/**
		 * CREATION DU JEU
		 */
		override public function create():void
		{
			// Active le scrolling
			if (FlxG.getPlugin(FlxScrollZone) == null)
			{
				FlxG.addPlugin(new FlxScrollZone);
			}
			// AJOUT DES OBJETS
			ship = new Ship();
			area = new Area(ship);
			hb = new Hitbox(ship);
			add(bg);
			add(ens);
			add(en.pv);
			ens.add(en);
			add(area);
			add(ship.pv);
			add(ship)
			add(hb);
			ships.add(ship);
			add(ship.tirs);
			add(en.tirs);
			add(cur);
			time = new FlxText(FlxG.width / 2 -50 , FlxG.height / 2 , 200, "Temps : " + ship.tirs.length.toString());
			time.setFormat(null, 12, 0x044071);
			add(time);
		}
		
		/**
		 * MISE A JOUR DU JEU
		 */
		override public function update():void
		{
			super.update();
			// Update textures & texte
			area.sticktoship(ship);
			hb.sticktoship(ship);
			ship.angle = FlxVelocity.angleBetween (ship, cur, true ) +90;
			time.text = "Vies : " + ship.life.toString();
			cur.x = FlxG.mouse.x - cur.frameWidth / 2;
			cur.y = FlxG.mouse.y - cur.frameHeight / 2;
			
			// Bouge le vaisseau
			ship.moveship(area, cur);
			
			//Collisions
			damage();
			hit();
			// Recyclage des tirs
			ship.recycletirs(cur)
			en.recycletirs(ship)
			// Recyclage ennemis
			en.mort();
		}
		
		// Gestion des collisions tirs > ennemis
		public function hit():void{
			for each (var en:Ennemis in ens.members) {
				if (en.exists) {
					for each (var tir:Tir in ship.tirs.members) {
						if (tir.exists == true) {
							if ((en != null) && (tir != null) && (FlxCollision.pixelPerfectCheck(tir, en))) {
								tir.exists = false;
								en.hurt(dmg);
								en.sound.play();
								en.mort();
							}
						}
					}
				}
			}
		}
		
		// Gestion des collisions tirsennemis > vaisseau, à généraliser
		public function damage():void{
			for each (var en:Ennemis in ens.members) {
				if (en.exists) {
					for each (var tir:Tir in en.tirs.members) {
						if (tir.exists == true) {
							if ((ship != null) && (tir != null) && (FlxCollision.pixelPerfectCheck(tir, hb))) {
								tir.exists = false;
								ship.hurt(dmg);
								ship.mort();
							}
						}
					}
				}
			}
		}

	}
}
