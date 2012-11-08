package
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;


	/**
	 * Main game play state
	 * @author 
	 */
	public class PlayState extends FlxState
	{	
		// VARIABLES DE PLAYSTATE
		public var paddle:Paddle;
		public var shoot:Launcher;
		public var shootactive:Boolean = false;
		public var shootexist:Boolean = false;
		public var missilescount:int = 0;
		public var missiles:Array = new Array(50);
		public var missileexist:Boolean = false;
		public var maxmissiles:int = 50;
		public var missile:FlxSprite;
		public var tir:Tir;
		
		/**
		 * CREATION DU JEU
		 */
		override public function create():void
		{
			FlxG.bgColor = 0xaa519CCA;
			// AJOUT DES OBJETS
			paddle = new Paddle();
			add(paddle);
			/*
			// INITIALISATION TABLEAU DES MISSILES
			for (var z:int; z < maxrow; z++) {
				missiles[z] = null;
			}*/
			
		}
		
		/**
		 * MISE A JOUR DU JEU
		 */
		override public function update():void
		{	
			super.update();
			/*
			// ATTRAPER BONUS SHOOT
			if (FlxG.overlap(paddle, shoot)) {
				shoot.kill();
				missile = new FlxSprite(paddle.x - paddle.padwidth / 2 - 15, paddle.y - 20, ImgLauncher);
				add(missile);
				shootactive = true;
				shootexist = false;
			}
			
			for (var m:int = 0; m < maxmissiles; m++) {
				// COLLISION DES MISSILES
				if (missiles[m] != null) 
					FlxG.collide(missiles[m], destBlock, hitblock);
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
			
			tir = new Tir(paddle);
			add(tir);
			/*
			// TIR DE MISSILE
			if (FlxG.keys.justReleased("N")) {
					if ((shootactive == true) && (missilescount < maxmissiles)) {
							missileexist = true;
							for (var triple:int = 0; triple < 3; triple++) {
								if (triple != 2) {
									missiles[missilescount] = new Missile(paddle.x + paddle.padwidth / 2 - 15*triple, paddle.y - 50);
									missiles[missilescount].velocity.x = triple * 300;
								}
								else {
									missiles[missilescount] = new Missile(paddle.x + paddle.padwidth / 2+ 15, paddle.y - 50);
									missiles[missilescount].velocity.x = -300;
								}						
								missiles[missilescount].velocity.y = -300;
								missiles[missilescount].missilenum = missilescount;
								add(missiles[missilescount]);
								missilescount++;
							}
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
