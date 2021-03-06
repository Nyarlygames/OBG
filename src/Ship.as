package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxRect;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxPoint;
	
	/**
	 * Ship
	 * @author ...
	 */
	public class Ship extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/ship.png')] public var ImgShip:Class;
		[Embed(source = '../assets/gfx/sperma.png')] public var ImgSperma:Class;
		[Embed(source = '../assets/gfx/tir.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class;
		public var maxtir:int = 250;
		public var pv:FlxBar;
		public var life:int = 999999999999;
		public var score:int = 0;
		public var shootgroup:FlxGroup = new FlxGroup();
		public var shoot:FlxWeapon;
		public var shoot2:FlxWeapon;
		public var shoot3:FlxWeapon;
		public var speed:int = 300;
		public var hb:Hitbox;
		public var area:Area;
		public var dmg:int = 1;
		public var to:FlxPoint = new FlxPoint(0, 0);
		public var dist:FlxPoint = new FlxPoint(0, 0);
		public var cam:Camera;
		
		public function Ship() 
		{
			super(FlxG.width / 2, 100);
			loadGraphic(ImgSperma, true, false, 90, 90);
			addAnimation("loop", [0, 1, 2, 3, 4, 5, 6], 10, true);
			play("loop");
			immovable = true;
		//	velocity.y = 100;
			health = 100;
			pv = new FlxBar(16, 64, FlxBar.FILL_LEFT_TO_RIGHT, 64, 4, this, "health");
			pv.trackParent(0, -30);
			exists = true;
			shoot = new FlxWeapon("shoot", this, "x", "y");
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot.setFireRate(100);
			shoot.setBulletSpeed(300);
			shoot.setBulletLifeSpan(2000);
			shoot.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot2 = new FlxWeapon("shoot", this, "x", "y");
			shoot2.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot2.setFireRate(100);
			shoot2.setBulletLifeSpan(2000);
			shoot2.setBulletSpeed(300);
			shoot2.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot3 = new FlxWeapon("shoot", this, "x", "y");
			shoot3.makeImageBullet(maxtir, ImgShoot, frameWidth/2, frameHeight/2);
			shoot3.setFireRate(100);
			shoot3.setBulletSpeed(300);
			shoot3.setBulletLifeSpan(2000);
			shoot3.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shootgroup.add(shoot.group);
			shootgroup.add(shoot2.group);
			shootgroup.add(shoot3.group);
		}
			
		
		// TIR ET ARRETE LE DEPLACEMENT
		override public function update():void {
			if ((FlxVelocity.distanceToPoint(this, dist) <= 5)) {
				velocity.x = 0;
				velocity.y = 0;
			}


			to.x = FlxG.mouse.x - (x + frameWidth/2) -25;
			to.y = FlxG.mouse.y - (y + frameHeight / 2) - 25;
			if (cam != null) {
				if (y - cam.y <= 0) {
					velocity.x = 0;
					velocity.y = 120;
				}
				else {
					velocity.x = to.x;
					velocity.y = to.y;
				}
			}

			dist.x = FlxG.mouse.x;
			dist.y = FlxG.mouse.y;
			
		//	if (FlxG.mouse.pressed()) {
				shoot2.fireFromAngle(angle -60);
				shoot3.fireFromAngle(angle -120);
				shoot.fireFromAngle(angle - 90);
		//	}
		}
		
		// Mort du vaisseau
		public function mort():FlxSprite {
			if (health <= 0) {
				var explosion:FlxSprite = new FlxSprite(x, y);
				explosion.loadGraphic(Explode, true, false, 256, 128);
				explosion.addAnimation("explode", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], 15, true);
				explosion.exists = false;
				explosion.x = x - explosion.frameWidth/2 + frameWidth /2;
				explosion.y = y - explosion.frameHeight/2 + frameHeight /2;
				explosion.exists = true;
				explosion.play("explode");
				if (life == 0) {
					restart();
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
		
		
		// PARTIE FINIE
		public function restart():void {
			area.exists = false;
			hb.exists = false;
			pv.exists = false;
			exists = false;
		}
	}

}