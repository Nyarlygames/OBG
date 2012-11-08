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
		public var ball:Ball;
		public var maxblock:int = 46;
		public var maxrow:int = 6;
		public var blocks:Block;
		public var destBlock:FlxGroup;
		public var ballsLeft:int = 3;
		public var score:int = 0;
		public var enl:Enlargement;
		public var doublesize:Boolean = false;
		public var enlexist:Boolean = false;
		public var red:Reduce;
		public var reducesize:Boolean = false;
		public var redexist:Boolean = false;
		public var shoot:Launcher;
		public var shootactive:Boolean = false;
		public var shootexist:Boolean = false;
		public var missilescount:int = 0;
		public var missiles:Array = new Array(50);
		public var missileexist:Boolean = false;
		public var maxmissiles:int = 50;
		public var missile:FlxSprite;
		public var tir:Tir;
		public var ballsLeftLabel:FlxText = new FlxText(FlxG.width - 150, FlxG.height - 30, 200, "Balles restantes : " + ballsLeft.toString());
		public var scoreLabel:FlxText = new FlxText(FlxG.width - 90, FlxG.height - 50, 200, "Score : " + score);
		public var gameover:FlxText = new FlxText(FlxG.width / 2 -50 , FlxG.height / 2 , 200, "Game Over");
		public var win:FlxText = new FlxText(FlxG.width / 2 -50 , FlxG.height / 2 , 200, "JAYJAY!");
		public var retry:FlxText = new FlxText(FlxG.width / 2 -50, FlxG.height / 2 + 100, 250, "Appuyez sur \"Espace\" pour recommencer");
		[Embed(source = '../assets/gfx/launcher.png')] public var ImgLauncher:Class;
		
		/**
		 * CREATION DU JEU
		 */
		override public function create():void
		{
			FlxG.bgColor = 0xaa519CCA;
			// AJOUT DES OBJETS
			paddle = new Paddle();
			add(paddle);
			ball = new Ball();
			add(ball);
			destBlock = new FlxGroup;
			add(destBlock);
			// BOUCLE DES BLOCS
			for (var y:int; y < maxrow; y++) {
				for (var x:int; x < maxblock; x++) {
					blocks = new Block(x*22 + (FlxG.width - maxblock*22)/2 ,y*22);
					destBlock.add(blocks);
				}
				x = 0;
			}
			// INITIALISATION TABLEAU DES MISSILES
			for (var z:int; z < maxrow; z++) {
				missiles[z] = null;
			}
			destBlock.add(blocks);
			// COULEUR TEXTES
			ballsLeftLabel.setFormat(null, 12, 0x044071);
			scoreLabel.setFormat(null, 12, 0x044071);
			gameover.setFormat(null, 12, 0x044071);
			win.setFormat(null, 12, 0x044071);
			retry.setFormat(null, 12, 0x044071);
			add(ballsLeftLabel);
			add(scoreLabel);
		}
		
		/**
		 * MISE A JOUR DU JEU
		 */
		override public function update():void
		{	
			super.update();
			// COLLISIONS
			FlxG.collide(ball, paddle)
			FlxG.collide(ball, destBlock, hitblock);
			
			
			// ATTRAPER BONUS GROSSIR
			if (FlxG.overlap(paddle, enl)) {
				enl.kill();
				paddle.loadGraphic(paddle.ImgPaddleenl);
				paddle.padwidth = 200;
				doublesize = true;
				enlexist = false;
			}
			// ATTRAPER BONUS REDUCTION
			if (FlxG.overlap(paddle, red)) {
				red.kill();
				ball.loadGraphic(ball.ImgBallred);
				ball.ballheight = 21;
				ball.ballwidth = 20;
				reducesize = true;
				redexist = false;
			}
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
				ball.velocity.x = 0;
				ball.velocity.y = 0;
				ballsLeft--;
				paddle.loadGraphic(paddle.ImgPaddle);
				paddle.padwidth = 150;
				ball.loadGraphic(ball.ImgBall);
				ball.ballheight = 21;
				ball.ballwidth = 20;
				ball.x = paddle.x + paddle.padwidth/2;
				ball.y = paddle.y - 40;
				reducesize = false;
				shootactive = false;
				doublesize = false;
				enlexist = false;
				redexist = false;
				shootexist = false;
				// NETTOIE L'ECRAN
				if (enl != null)
					enl.kill();
				if (red != null)
					red.kill();
				if (shoot != null)
					shoot.kill();
				if (missile != null) {
					missile.kill();
					missile.destroy();
					missile = null;
				}
			}			
			// BALL BORD GAUCHE
			if (ball.x  < 0) {
				ball.velocity.x = -ball.velocity.x;
			}			
			// BALL BORD HAUT
			if (ball.y < 0) {
				ball.velocity.y = -ball.velocity.y;
			}			
			// BALLE BORD DROIT
			if (ball.x > FlxG.width - (ball.ballwidth)) {
				ball.velocity.x = -ball.velocity.x;
			}
			// UPDATE DES TEXTES
			ballsLeftLabel.text = "Balles restantes : " + ballsLeft.toString();
			scoreLabel.text = "Score : " + score.toString();
			
			// PERD LA PARTIE
			if (ballsLeft == 0) {
				ball.velocity.x = 0;
				ball.velocity.y = 0;
				if (enl != null)
					enl.kill();
				if (red != null)
					red.kill();
				if (shoot != null)
					shoot.kill();
				if (missile != null)
					missile.kill();
				add(gameover);
				// RETRY
				add(retry);
				if (FlxG.keys.pressed("SPACE")) {
					FlxG.switchState(new PlayState());
				}
			}
			// BONUS GROSSIR LOUPE
			if ((enl != null) && (enl.y > FlxG.height)) {
				enl.kill();
				enlexist = false;
			}
			// BONUS REDUCTION LOUPE
			if ((red != null) && (red.y > FlxG.height)) {
				red.kill();
				redexist = false;
			}
			// BONUS LAUNCHER LOUPE
			if ((shoot != null) && (shoot.y > FlxG.height)) {
				shoot.kill();
				shootexist = false;
			}
			
			// GAGNE LA PARTIE
			if (destBlock.length == score) {
				ball.velocity.x = 0;
				ball.velocity.y = 0;
				add(win);
				add(retry);
				if (FlxG.keys.pressed("SPACE")) {
					FlxG.switchState(new PlayState());
				}
			}
			// LANCER BOULE
			if ((FlxG.keys.pressed("SPACE")) && (ball.velocity.x == 0) && (ball.velocity.y == 0) 
				&& (ballsLeft > 0) && (destBlock.length != score)) {
				ball.velocity.x = -300;
				ball.velocity.y = -300;
			}
			
			
			tir = new Tir(paddle);
			add(tir);
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
			}
			// BALLE SUIT LE PADDLE QUAND STOPPEE
			if ((ball.velocity.x == 0)  && (ball.velocity.y == 0)) {
				ball.x = paddle.x + paddle.padwidth/2;
				ball.y = paddle.y - 40;
			}
			// LAUNCHER SUIT LE PADDLE
			if ((missile != null) && (shootactive = true)) {
				missile.x = paddle.x + paddle.padwidth / 2 - 15;
				missile.y = paddle.y - 10;	
			}
		}
		
		
		// COLLISIONS
		public function hitblock(obj1:FlxObject, obj2:FlxObject):void {
			score++;
			// MISSILE
			if (obj1 is Missile) {
				nettoyermissile();
			}
			// BLOC
			if (obj2 is Block) {
				destBlock.remove(obj2);
				obj2.destroy();
				// POP BONUS GROSSIR
				if ((Math.floor(Math.random() * (1 + 100 - 0)) > 90) && (doublesize==false) && (enlexist ==false)) {
					enl = new Enlargement(obj2.x , obj2.y);
					enl.velocity.y = 150;
					enlexist = true;
					add(enl);
				}
				// POP BONUS REDUIRE
				else if ((Math.floor(Math.random() * (1 + 100 - 0)) > 90) && (reducesize == false) && (redexist == false)) {
					red = new Reduce(obj2.x , obj2.y);
					red.velocity.y = 150;
					redexist = true;
					add(red);					
				} 
				// POP BONUS LAUNCHER
				else if ((Math.floor(Math.random() * (1 + 100 - 0)) > 90) && (shootactive == false) && (shootexist == false)) {
					shoot = new Launcher(obj2.x , obj2.y);
					shoot.velocity.y = 150;
					shootexist = true;
					add(shoot);					
				}
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
		}
	}
}
