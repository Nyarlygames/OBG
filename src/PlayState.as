package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxVelocity;

	/**
	 * Main game play state
	 * @author 
	 */
	public class PlayState extends FlxState
	{	
		// VARIABLES DE PLAYSTATE
		public var ship:Ship;
		public var tirs:FlxGroup;
		public var maxtir:int = 50000;
		public var tir:Tir;
		public var tirscount:int = 0;
		public var count:int = 0;
		public var time:FlxText = new FlxText(FlxG.width / 2 -50 , FlxG.height / 2 , 200, "Temps : " + count.toString());
		public var cur:Cursor;
		public var to:FlxPoint = new FlxPoint();
		/**
		 * CREATION DU JEU
		 */
		override public function create():void
		{
			FlxG.bgColor = 0xaa519CCA;
			// AJOUT DES OBJETS
			ship = new Ship();
			add(ship);
			cur = new Cursor();
			add(cur);
			tirs = new FlxGroup;
			add(tirs);
			FlxG.mouse.show();
			time.setFormat(null, 12, 0x044071);
			add(time);
			//INITIALISATION TABLEAU DES MISSILES
			trace(tirs);
			
		}
		
		/**
		 * MISE A JOUR DU JEU
		 */
		override public function update():void
		{	
			super.update();
			count++;
			time.text = "Tirs : " + tirscount.toString();
			cur.x = FlxG.mouse.x;
			cur.y = FlxG.mouse.y;
			if (tirscount < maxtir) {
				tirs.add(new Tir(ship));
				tirscount++;
			}
			
			to.x = FlxG.mouse.x - (ship.x + ship.shipwidth/2);
			to.y = FlxG.mouse.y - (ship.y + ship.shipheight / 2);
			trace(to.x, to.y);
			if ((to.x > 40) && (to.y > 40) || (to.x < -40) && (to.y < -40))
				FlxVelocity.moveTowardsObject(ship, cur, 10);
			FlxVelocity.moveTowardsObject(ship, cur, 500);
			/*
			for (var m:int = 0; m < maxtirs; m++) {
				// COLLISION DES TIRS
				if (tirs[m] != null) 
					FlxG.collide(tirs[m], destBlock, hitblock);
				// MISSILES DEPASSE LE BORD HAUT
				if ((missiles[m] != null) && (missiles[m].y < 0)) {
						nettoyermissile();
				}
			}
			// BALL BORD BAS, RESET DE TOUT
			if (ball.y > FlxG.height) {
				shootactive = false;
				shootexist = false;
				if (missile != null) {
					missile.kill();
					missile.destroy();
					missile = null;
				}
			}
			// BALL BORD GAUCHE
			if (paddle.x  < 0) {
				ball.velocity.x = -ball.velocity.x;
			}			
			// BALL BORD HAUT
			if (ball.y < 0) {
				ball.velocity.y = -ball.velocity.y;
			}			
			// BALLE BORD DROIT
			if (ball.x > FlxG.width - (ball.ballwidth)) {
				ball.velocity.x = -ball.velocity.x;
			}*/
			// TIR DE MISSILE				
			/* PARCOURIR LISTE
			 * if (tirscount > 0) {
				for (var t:int = 0; t < tirscount - 1; t++) {
					//tirs.members[t]
				}
			}*/
		}
		
		/*// COLLISIONS
		public function hitblock(obj1:FlxObject, obj2:FlxObject):void {
			score++;
			// MISSILE
			if (obj1 is Missile) {
				nettoyermissile();
			}
		}
		
		
		// SUPPRIMES LES MISSILES USAGES
		public function nettoyermissile ():void {
			missiles[0].kill();
			missiles[0].destroy();
			missiles[0] = null;
			for (var m:int = 0; m < missilescount - 1; m++) {
				missiles[m] = missiles[m+1];
			}
			missiles[missilescount] = null;
			missileexist = false;
			missilescount--;
		}*/
	}
}
