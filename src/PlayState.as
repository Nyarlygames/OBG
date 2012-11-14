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
	import org.flixel.plugin.photonstorm.FlxWeapon;

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
		public var explodes:FlxGroup = new FlxGroup();
		public var ships:FlxGroup = new FlxGroup();
	//	public var en:Classique = new Classique(100, FlxG.width / 2, FlxG.height -100);
		public var dmg:int = 1;
		public var time:FlxText;
		public var cur:Cursor = new Cursor();
		public var bg:Background = new Background();
		[Embed(source = "../maps/map01.txt", mimeType = "application/octet-stream")] public var mapfile:Class;
		public var map:Map;
		
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
			map = new Map(mapfile, ship);
			area = new Area(ship);
			hb = new Hitbox(ship);
			add(bg);
			ens = map.ens;
			add(ens);
			for each (var op:Ennemis in ens.members) {
				if (op != null){
					add(op.pv);
					add(op.shoot.group);
				}
			}
			add(area);
			add(ship.pv);
			add(ship)
			add(hb);
			ships.add(ship);
			add(ship.shoot.group);
			add(cur);
			time = new FlxText(FlxG.width / 2 -50 , FlxG.height / 2 , 200, "Temps : " + ship.shoot.group.length.toString());
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
			
			//Collisions & tirs
			FlxG.overlap(ship.shoot.group, ens, hit);
			ship.shoot.fireAtMouse();
			for each (var op:Ennemis in ens.members) {
				if ((op != null) && (op.exists == true)) {
					op.behave();
					FlxG.overlap(op.shoot.group, ship, damage);
					op.shoot.fireAtTarget(hb);
				}
			}
			
			for each (var expl:FlxSprite in explodes.members) {
				if ((expl != null) && (expl.exists == true))
					if (expl.finished) {
						expl.exists = false;
						explodes.remove(expl, true);
					}
			}
		}
		
		// TOUCHE ENNEMIS
		private function hit(bullet:FlxObject, target:Ennemis):void
		{	
			var explode:FlxSprite;
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target as Ennemis))
			{
				target.hurt(dmg);
				target.sound.play(); 
				bullet.kill();
				explode = target.mort();
				explodes.add(explode);
				add(explode);
			}		
		}
		
		// TOUCHE PAR ENNEMIS
		private function damage(bullet:FlxObject, target:Ship):void
		{
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target as Ship))
			{
				target.hurt(dmg);
				bullet.kill();
				target.mort();
			}			
		}
	}
}
