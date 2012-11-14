package  
{
	import org.flixel.FlxObject;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.FlxSprite;
	
	/**
	 * Collisions
	 * @author ...
	 */
	public class Collisions extends FlxObject 
	{
		public var ps:PlayState;
		
		public function Collisions(play:PlayState) 
		{
			ps = play;
		}
		
		// TOUCHE ENNEMIS
		public function hit(bullet:FlxObject, target:Ennemis):void
		{	
			var explode:FlxSprite;
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target as Ennemis))
			{
				target.hurt(ps.dmg);
				target.sound.play(); 
				bullet.kill();
				explode = target.mort();
				if (explode != null) {
					ps.explodes.add(explode);
					ps.add(explode);
				}
			}		
		}
		
		// TOUCHE PAR ENNEMIS
		public function damage(bullet:FlxObject, target:Ship):void
		{
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target.hb as Hitbox))
			{
				target.hurt(1);
				bullet.kill();
				target.mort();
			}			
		}
		
		public function collide(touche:Ennemis, target:Ship):void
		{
			if (FlxCollision.pixelPerfectCheck(touche as Ennemis, target as Ship))
			{
				target.health = 0;
				touche.health = 0;
				touche.mort();
				target.mort();
			}			
		}
	}

}