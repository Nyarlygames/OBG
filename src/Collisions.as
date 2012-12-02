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
		public var ps:Play;
		public var op:Ennemis;
		
		public function Collisions(play:Play) 
		{
			ps = play;
		}
		
		// TOUCHE ENNEMIS
		public function hit(bullet:FlxObject, target:Ennemis):void
		{	
			var explode:FlxSprite;
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target as Ennemis))
			{
				target.hurt(ps.ship.dmg);
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
			var explode:FlxSprite;
			if (FlxCollision.pixelPerfectCheck(bullet as FlxSprite, target.hb as Hitbox) && (op != null))
			{
				target.hurt(op.dmg);
				bullet.kill();
				explode = target.mort();
				if (explode != null) {
					ps.explodes.add(explode);
					ps.add(explode);
				}
			}			
		}
		
		// COLLISIONS ENNEMIS
		public function collide(touche:Ennemis, target:Ship):void
		{
			var explode:FlxSprite;
			var exploded:FlxSprite;
			if (FlxCollision.pixelPerfectCheck(touche as Ennemis, target as Ship) && (op != null))
			{
				target.health = 0;
				touche.health = 0;
				explode = touche.mort();
				if (explode != null) {
					ps.explodes.add(explode);
					ps.add(explode);
				}
				exploded = target.mort();
				if (exploded != null) {
					ps.explodes.add(exploded);
					ps.add(exploded);
				}
			}			
		}
		
		// COLLISIONS BORDERS
		public function collide_borders(ship:Ship, borders:FlxSprite):void
		{
			if (FlxCollision.pixelPerfectCheck(ship as Ship, borders as FlxSprite))
				ship.speed = 150;
			else
				ship.speed = 300;
		}
		
		
		
	}

}