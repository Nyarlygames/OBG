package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	/**
	 * Ship
	 * @author ...
	 */
	public class Ship extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/ship.png')] public var ImgShip:Class;
		[Embed(source = '../assets/gfx/tir.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class;
		public var to:FlxPoint = new FlxPoint();
		public var maxtir:int = 250;
		public var pv:FlxBar;
		public var life:int = 3;
		public var shoot:FlxWeapon;
		public var hb:Hitbox;
		public var dmg:int = 1;
		
		public function Ship() 
		{
			super(FlxG.width / 2, 100, ImgShip);
			immovable = true;
			health = 100;
			pv = new FlxBar(16, 64, FlxBar.FILL_LEFT_TO_RIGHT, 64, 4, this, "health");
			pv.trackParent(0, -30);
			exists = true;
			shoot = new FlxWeapon("shoot", this, "x", "y");
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(2);
			shoot.setBulletSpeed(300);
		}
			
		// Vaisseau bouge vers curseur
		public function moveship(area:Area, cur:Cursor):void {
			to.x = FlxG.mouse.x - (this.x + this.frameWidth/2);
			to.y = FlxG.mouse.y - (this.y + this.frameHeight / 2);
			if (((int(to.x) > int(area.frameWidth/2)) || (int(to.y) > int(area.frameHeight/2))) || (
				(int(to.x) < -int(area.frameWidth/2)) || (int(to.y) < -int(area.frameHeight/2)))) {
					FlxVelocity.moveTowardsMouse(this,2*FlxVelocity.distanceToMouse(this));
			}
			else if	(FlxCollision.pixelPerfectCheck(area, cur)) {
				this.velocity.x = 0;
				this.velocity.y = 0;
			}
		}
		
		// Mort du vaisseau
		public function mort():FlxSprite {
			if (health == 0) {
				var explosion:FlxSprite = new FlxSprite(x, y)
				explosion.loadGraphic(Explode, true, false, 256, 128);
				explosion.addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 15, true);
				explosion.exists = false;
				explosion.x = x - explosion.frameWidth/2 + frameWidth /2;
				explosion.y = y - explosion.frameHeight/2 + frameHeight /2;
				explosion.exists = true;
				explosion.play("explode");
				if (life == 0) {
					exists = false;
					pv.exists = false;
				}
				else {
					health = 100;
					exists = true;
					pv.exists = true;
					life--;
				}
				return(explosion);
			}
			return (null);
		}
	}

}