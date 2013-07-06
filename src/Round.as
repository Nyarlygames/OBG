package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxG;
	import org.flixel.FlxRect;
	/**
	 * Ennemis Round
	 * @author ...
	 */
	public class Round extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/aids.png')] public var ImgAids:Class;
		[Embed(source = '../assets/gfx/tir4.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class;
		public var ship:Ship;
		public var shoot1:FlxWeapon;
		public var shoot2:FlxWeapon;
		public var shoot3:FlxWeapon;
		public var shoot4:FlxWeapon;
		public var shoot5:FlxWeapon;
		public var shoot6:FlxWeapon;
		public var shoot7:FlxWeapon;
		public var shoot8:FlxWeapon;
		public var shoot9:FlxWeapon;
		public var shoot10:FlxWeapon;
		public var shoot11:FlxWeapon;
		public var shoot12:FlxWeapon;
		public var shoot13:FlxWeapon;
		
		public function Round(vie:int, x:int, y:int, value:int, player:Ship, move:FlxPoint) 
		{
			super(x, y, ImgAids, vie, ship, move);
			sound = new FlxSound();
			score = value;
			ship = player;
			sound.loadStream("../assets/sfx/mort.mp3", false, true);
			shoot = new FlxWeapon("shoot", this, "x", "y");
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot.setFireRate(500);
			shoot.setBulletSpeed(200);
			shoot.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			
			shoot1 = new FlxWeapon("shoot", this, "x", "y");
			shoot1.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot1.setFireRate(500);
			shoot1.setBulletSpeed(200);
			shoot1.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot1.setBulletLifeSpan(2000);
			
			shoot2 = new FlxWeapon("shoot", this, "x", "y");
			shoot2.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot2.setFireRate(500);
			shoot2.setBulletSpeed(200);
			shoot2.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot2.setBulletLifeSpan(2000);
			
			shoot3 = new FlxWeapon("shoot", this, "x", "y");
			shoot3.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot3.setFireRate(500);
			shoot3.setBulletSpeed(200);
			shoot3.setBulletBounds(new FlxRect(0, 0, 800, 3000));
			shoot3.setBulletLifeSpan(2000);
			
			shoot4 = new FlxWeapon("shoot", this, "x", "y");
			shoot4.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot4.setFireRate(500);
			shoot4.setBulletSpeed(200);
			shoot4.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot4.setBulletLifeSpan(2000);
			
			
			shoot5 = new FlxWeapon("shoot", this, "x", "y");
			shoot5.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot5.setFireRate(500);
			shoot5.setBulletSpeed(200);
			shoot5.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot5.setBulletLifeSpan(2000);
			
			
			shoot6 = new FlxWeapon("shoot", this, "x", "y");
			shoot6.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot6.setFireRate(500);
			shoot6.setBulletSpeed(200);
			shoot6.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot6.setBulletLifeSpan(2000);
			
			
			shoot7 = new FlxWeapon("shoot", this, "x", "y");
			shoot7.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot7.setFireRate(500);
			shoot7.setBulletSpeed(200);
			shoot7.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot7.setBulletLifeSpan(2000);
			
			shoot8 = new FlxWeapon("shoot", this, "x", "y");
			shoot8.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot8.setFireRate(500);
			shoot8.setBulletSpeed(200);
			shoot8.setBulletBounds(new FlxRect(0, 0, 800, 3000));
			shoot8.setBulletLifeSpan(2000);
			
			shoot9 = new FlxWeapon("shoot", this, "x", "y");
			shoot9.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot9.setFireRate(500);
			shoot9.setBulletSpeed(200);
			shoot9.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot9.setBulletLifeSpan(2000);
			
			shoot10 = new FlxWeapon("shoot", this, "x", "y");
			shoot10.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot10.setFireRate(500);
			shoot10.setBulletSpeed(200);
			shoot10.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot10.setBulletLifeSpan(2000);
			
			shoot11 = new FlxWeapon("shoot", this, "x", "y");
			shoot11.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot11.setFireRate(500);
			shoot11.setBulletSpeed(200);
			shoot11.setBulletBounds(new FlxRect(0, 0, 800, 3000));
			shoot11.setBulletLifeSpan(2000);
			
			shoot12 = new FlxWeapon("shoot", this, "x", "y");
			shoot12.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot12.setFireRate(500);
			shoot12.setBulletSpeed(200);
			shoot12.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot12.setBulletLifeSpan(2000);
			shoot13 = new FlxWeapon("shoot", this, "x", "y");
			shoot13.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot13.setFireRate(500);
			shoot13.setBulletSpeed(200);
			shoot13.setBulletBounds(new FlxRect(0, 0, 8000, 3000));
			shoot13.setBulletLifeSpan(2000);
			FlxG.state.add(shoot.group);
			FlxG.state.add(shoot1.group);
			FlxG.state.add(shoot2.group);
			FlxG.state.add(shoot3.group);
			FlxG.state.add(shoot4.group);
			FlxG.state.add(shoot5.group);
			FlxG.state.add(shoot6.group);
			FlxG.state.add(shoot7.group);
			FlxG.state.add(shoot8.group);
			FlxG.state.add(shoot9.group);
			FlxG.state.add(shoot10.group);
			FlxG.state.add(shoot11.group);
			FlxG.state.add(shoot12.group);
			FlxG.state.add(shoot13.group);
			dmg = 20;
		}
		
		override public function update():void {
			if (this.onScreen(FlxG.camera)){
				shoot.fireAtTarget(ship);
				shoot12.fireFromAngle(-180);
				shoot1.fireFromAngle(-90);
				shoot2.fireFromAngle(-0);
				shoot3.fireFromAngle(90);
				shoot4.fireFromAngle(-120);
				shoot5.fireFromAngle(-60);
				shoot6.fireFromAngle(60);
				shoot7.fireFromAngle(120);
				shoot8.fireFromAngle(-30);
				shoot9.fireFromAngle(-150);
				shoot10.fireFromAngle(300);
				shoot11.fireFromAngle(150);
				shoot13.fireFromAngle(30);
			}
			//FlxVelocity.moveTowardsObject(this, ship);
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
				ship.cam.velocity.x = -50;
				return(explosion);
			}
			return(null);
		}
		
	}

}