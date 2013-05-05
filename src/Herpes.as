package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSound;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxG;
	import com.greensock.*;
	import com.greensock.events.TweenEvent;
	import com.greensock.easing.*;

	/**
	 * Ennemis Herpes
	 * @author ...
	 */
	public class Herpes extends Ennemis 
	{
		
		[Embed(source = '../assets/gfx/herpes.png')] public var ImgHerpes:Class;
		[Embed(source = '../assets/gfx/tir5.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class;
		[Embed(source = "../assets/gfx/aoe.png")] private var ImgAoe:Class;
		public var ship:Ship;
		public var aoe:FlxSprite;
		public var scaleX:int = 1;
		public var scaleY:int = 1;
		
		public function Herpes(vie:int, x:int, y:int, value:int, player:Ship) 
		{
			super(x, y, ImgHerpes, vie, ship);
			sound = new FlxSound();
			score = value;
			ship = player;
			sound.loadStream("../assets/sfx/mort.mp3", false, true);
			shoot = new FlxWeapon("shoot", this, "x", "y");
			shoot.makeImageBullet(maxtir, ImgShoot, frameWidth / 2, frameHeight / 2);
			shoot.setFireRate(500);
			shoot.setBulletSpeed(200);
			aoe = new FlxSprite(y, x, ImgAoe);
			FlxG.state.add(aoe);
			FlxG.state.add(shoot.group);
			dmg = 20;
		}
		
		override public function update():void {
			TweenMax.to(this, 2, { scaleX:1.5, scaleY:1.5, ease:Elastic.easeOut } );
		//	TweenMax.fromTo(this, 1, {x:100}, {x:300, tint:0xFF0000});
			shoot.fireAtTarget(ship);
			aoe.x = x-30;
			aoe.y = y-30;
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
				return(explosion);
			}
			return(null);
		}
		
	}

}