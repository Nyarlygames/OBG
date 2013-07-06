package  
{
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxRect;
	import org.flixel.plugin.photonstorm.FlxDelay;
	/**
	 * Ennemis de base
	 * @author ...
	 */
	public class Classique extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/ennemis.png')] public var ImgClassic:Class;
		[Embed(source = '../assets/gfx/tir2.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class;
		public var timer:FlxDelay;
		public var ship:Ship;
		
		public function Classique(vie:int, x:int, y:int, value:int, player:Ship, move:FlxPoint) 
		{
			super(x, y, ImgClassic, vie, ship, move);
			ship = player;
			score = value;
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/mort.mp3", false, true);
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(50);
			shoot.setBulletSpeed(200);
			shoot.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			dmg = 5;
		}
		
		override public function update():void {
			if (this.onScreen(FlxG.camera)){
				shoot.fireAtTarget(ship);
			}
			/*var back:FlxPoint = new FlxPoint;
			
			if (timer == null) {
				timer = new FlxDelay(2000);
				timer.start();
			}
			if (timer.hasExpired)
			{
				back.x = this.x;
				back.y = FlxG.height + this.frameHeight +200;
				FlxVelocity.moveTowardsMouse(this, 30);
				timer = null;
			}
			else {
				back.x = this.x;
				back.y = (FlxG.height / 5) * 3;
				FlxVelocity.moveTowardsMouse(this, 20);
			}*/
		}
		
		override public function mort():FlxSprite {
			if (health == 0) {
				pv.exists = false;
				//if (sound != null)
				//	sound.play();
				var explosion:FlxSprite = new FlxSprite(x, y)
				explosion.loadGraphic(Explode, true, false, 256, 128);
				explosion.addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 15, true);
				explosion.exists = false;
				explosion.x = x - explosion.frameWidth/2 + frameWidth /2;
				explosion.y = y - explosion.frameHeight/2 + frameHeight /2;
				explosion.exists = true;
				explosion.play("explode");
				this.exists = false;
				ship.score += score;
				ship.cam.velocity.x = 0;
				ship.cam.velocity.y = 200;
				return(explosion);
			}
			return(null);
		}
	}

}