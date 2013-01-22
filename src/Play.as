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
	import org.flixel.FlxTilemap;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.events.Event;
	import net.pixelpracht.tmx.TmxMap;
	import net.pixelpracht.tmx.TmxObject;
	import net.pixelpracht.tmx.TmxObjectGroup;

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
		public var bg:Background = new Background();
		public var tilemap:FlxTilemap = new FlxTilemap();
		//[Embed(source = '../assets/gfx/decor_tileset.png')] protected var ImgTileSet:Class;
		[Embed(source = "../maps/map01.txt", mimeType = "application/octet-stream")] public var mapfile:Class;
		public var map:Map;
		//[Embed(source = '../assets/sfx/sfx.swf', symbol = 'ambient.wav')] public var Ambient:Class;
		[Embed(source="../assets/sfx/kine.mp3")] private var SoundEffect:Class;
		public var ui:UI;

		
		/**
		 * CREATION DU JEU
		 */
		public function Play():void
		{
			// Active le scrolling
			if (FlxG.getPlugin(FlxScrollZone) == null)
			{
				FlxG.addPlugin(new FlxScrollZone);
			}
			// AJOUT DES OBJETS
			ship = new Ship();
			map = new Map(mapfile, ship);
			bg.switches = map.switches;
			area = new Area(ship);
			hb = new Hitbox(ship);
			coll = new Collisions(this);
			ui = new UI(this);
			add(bg);
			add(bg.borders);
			add(area);
			// VAISSEAU JOUEUR
			add(ship.pv);
			add(ship)
			add(hb);
			ship.hb = hb;
			ship.area = area;
			ships.add(ship);
			add(ship.shootgroup);
			
			//UI
			
			add(ui);
			add(ui.scoret);
			add(ui.viest);
			add(ui.niveaut);
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE,onTmxLoaded);
			loader.load(new	URLRequest('../maps/level1.tmx'));
			FlxG.stream("../assets/sfx/kine.mp3",0.3,true);

		}
		
		// LOAD MAP
		public function onTmxLoaded(e:Event):void {
			var xml:XML = new XML(e.target.data);
			var tmx:TmxMap = new TmxMap(xml);
			
			/*tilemap = new FlxTilemap();
			var csv:String = tmx.getLayer('Tile').toCsv(tmx.getTileSet('decor_tileset'));
			tilemap.loadMap(csv,ImgTileSet, 64, 64);
			add(tilemap);*/
			
			var group:TmxObjectGroup = tmx.getObjectGroup('Ennemis');
			for each(var object:TmxObject in group.objects) {
				switch(object.type) {
					case "Virus":
						map.ens.add (new Bomber(10, object.x, object.y, 10, ship));
						break;
					case "Bactérie":
						map.ens.add (new Classique(20, object.x, object.y, 10, ship));
						break;
				}
			}
			
			// ENNEMIS
			ens = map.ens;
			add(ens);
			for each (var op:Ennemis in ens.members) {
				if (op != null){
					add(op.pv);
					add(op.shoot.group);
				}
			}
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
