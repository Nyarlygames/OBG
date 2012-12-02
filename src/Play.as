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
	 * Level
	 * @author 
	 */
	public class Play extends FlxState
	{	
		// VARIABLES DE PLAYSTATE
		public var ship:Ship;
		public var area:Area;
		public var hb:Hitbox;
		public var coll:Collisions;
		public var ens:FlxGroup = new FlxGroup();
		public var explodes:FlxGroup = new FlxGroup();
		public var ships:FlxGroup = new FlxGroup();
		public var level:int = 1;
		public var scoret:FlxText;
		public var viest:FlxText;
		public var niveaut:FlxText;
		public var cur:Cursor;
		public var bg:Background = new Background();
		[Embed(source = "../maps/map01.txt", mimeType = "application/octet-stream")] public var mapfile:Class;
		public var map:Map;
		public var UI:FlxSprite;

		
		/**
		 * CREATION DU JEU
		 */
		override public function Play():void
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
			coll = new Collisions(this);
			cur = new Cursor(area,ship);
			add(bg);
			add(bg.borders);
			add(area);
			// ENNEMIS
			ens = map.ens;
			add(ens);
			for each (var op:Ennemis in ens.members) {
				if (op != null){
					add(op.pv);
					add(op.shoot.group);
				}
			}
			// VAISSEAU JOUEUR
			add(ship.pv);
			add(ship)
			add(hb);
			ship.hb = hb;
			ship.area = area;
			ships.add(ship);
			add(ship.shootgroup);
			add(cur);
			// UI
			UI = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height / 20, 0xaa4E4F4D, true);
			add(UI);
			scoret = new FlxText(20 , 0, FlxG.width /4, "");
			scoret.setFormat(null, 16, 0xADAEAC);
			niveaut = new FlxText(FlxG.width /4 ,0, FlxG.width /4, "");
			niveaut.setFormat(null, 16, 0xADAEAC);
			viest = new FlxText(FlxG.width * 2 / 4, 0 , FlxG.width * 2 /4, "");
			viest.setFormat(null, 16, 0xADAEAC);
			add(scoret);
			add(viest);
			add(niveaut);
		}
		
		/**
		 * MISE A JOUR DU JEU
		 */
		override public function update():void
		{
			
			var applyangle:Function = function(tir:FlxObject, index:int, array:Array):void {
				tir.angle = ship.angle;
			};
			
			super.update();
			// TEXTES
			viest.text = "Vies : " + ship.life.toString();
			scoret.text = "Score : " + ship.score;
			niveaut.text = "Niveau : " + level;
			
			
			
			//Collisions & tirs
			for each (var tirs:FlxGroup in ship.shootgroup.members) {
				if ((tirs != null) && (tirs.exists == true)) {
					
					tirs.members.forEach(applyangle);
					FlxG.overlap(tirs, ens, coll.hit);
				}
			}
			for each (var op:Ennemis in ens.members) {
				if ((op != null) && (op.exists == true)) {
					if ((FlxG.height - bg.y) > op.y)
						op.behave();
					coll.op = op;
					//op.shoot.group.members.forEach(applyangle_en);
					FlxG.overlap(op.shoot.group, ship, coll.damage);
					FlxG.overlap(op, ship, coll.collide);
					op.shoot.fireAtTarget(hb);
				}
			}
			coll.collide_borders(ship, bg.borders);
			
			for each (var expl:FlxSprite in explodes.members) {
				if ((expl != null) && (expl.exists == true))
					if (expl.finished) {
						expl.exists = false;
						explodes.remove(expl, true);
					}
			}
		}
	}
}
