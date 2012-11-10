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
		public var ens:FlxGroup;
		public var en:Ennemis;
		public var tirs:FlxGroup;
		public var maxtir:int = 250;
		public var tir:Tir;
		public var count:int = 0;
		public var time:FlxText = new FlxText(FlxG.width / 2 -50 , FlxG.height / 2 , 200, "Temps : " + count.toString());
		public var cur:Cursor;
		public var to:FlxPoint = new FlxPoint();
			
		public var vie:FlxBar;
		/**
		 * CREATION DU JEU
		 */
		override public function create():void
		{
			FlxG.bgColor = 0xaa519CCA;
			// AJOUT DES OBJETS
			ship = new Ship();
			area = new Area(ship);
			ens = new FlxGroup();
			en = new Ennemis();
			add(ens);
			ens.add(en);
			add(area);
			add(ship);
			cur = new Cursor();
			add(cur);
			tirs = new FlxGroup;
			add(tirs);
			FlxG.mouse.show();
			time.setFormat(null, 12, 0x044071);
			add(time);
		}
		
		/**
		 * MISE A JOUR DU JEU
		 */
		override public function update():void
		{	
			super.update();
			// Update textures texte
			area.sticktoship(ship);
			ship.angle = FlxVelocity.angleBetween (ship, cur, true ) +90;
			count++;
			time.text = "Tirs : " + tirs.length.toString();
			cur.x = FlxG.mouse.x - cur.frameWidth/2;
			cur.y = FlxG.mouse.y - cur.frameHeight / 2;
			
			// Vaisseau bouge vers curseur
			to.x = FlxG.mouse.x - (ship.x + ship.frameWidth/2);
			to.y = FlxG.mouse.y - (ship.y + ship.frameHeight / 2);
			if (((int(to.x) > int(area.frameWidth/2)) || (int(to.y) > int(area.frameHeight/2))) || (
				(int(to.x) < -int(area.frameWidth/2)) || (int(to.y) < -int(area.frameHeight/2)))) {
					FlxVelocity.moveTowardsMouse(ship,200);
				}
			else if	(FlxCollision.pixelPerfectCheck(area, cur)) {
				ship.velocity.x = 0;
				ship.velocity.y = 0;
			}
			/*for each (var en:Ennemis in ens.members) {
				for each (var tir:Tir in tirs.members) {
					if ((tir != null) && (FlxCollision.pixelPerfectCheck(tir, ens))) {
						ens.pv --;
					}
					/*if (ens.pv == 0) {
						recyclerens();
					}
				}
			}*/
			FlxG.collide(tirs, ens, hit);
			
			// Recyclage des tirs
			recycletirs()
		}
		
		// Gestion des collisions
		public function hit(g1:Tir, g2:Ennemis):void{
			g1.exists = false;
			g2.pv--;
			recyclerens();
		}
		
		public function recyclerens():void {
			for each (var en:Ennemis in ens.members) {
				if ((en != null) && (en.pv == 0)) {
					en.exists = false;
				}
			}
		}
		
		// Gestion des balles pour performances
		public function recycletirs():void{
			for each (var tir:Tir in tirs.members) {
				if ((tir != null) && ((tir.x > FlxG.width) || (tir.y > FlxG.height) || 
						(tir.x < 0) || (tir.y < 0))) {
						tir.exists = false;
				}
			}
			if (tirs.length < maxtir) {
				ajoutertir();
				tirs.add(ajout);
			}
			else {
				var ajout:Tir =  tirs.getFirstAvailable() as Tir;
				if (ajout != null)
				 ajout.updatetir(ship);
			}
		}
		
		public function ajoutertir():void {
			var t:int = tirs.getFirstNull();
			if (t != -1) {
				var ajout:Tir =  tirs.getFirstAvailable() as Tir;
				ajout = new Tir(ship);
				ajout.exists = true;
				tirs.add(ajout);
			}
		}

	}
}
