package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxCollision;
	/**
	 * Curseur
	 * @author ...
	 */
	public class Cursor extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/cursor.png')] public var ImgCursor:Class;
		public var to:FlxPoint = new FlxPoint();
		public var dist:FlxPoint = new FlxPoint();
		public var area:Area;
		public var ship:Ship;
		
		public function Cursor(zone:Area, player:Ship) 
		{
			area = zone;
			ship = player;
			super(FlxG.mouse.x , FlxG.mouse.y, ImgCursor);
		}
		
		override public function update():void {
			x = FlxG.mouse.x - frameWidth / 2;
			y = FlxG.mouse.y - frameHeight / 2;
			
			/*
				//if (((int(to.x) > int(area.frameWidth/2)) || (int(to.y) > int(area.frameHeight/2))) || (
				//	(int(to.x) < -int(area.frameWidth/2)) || (int(to.y) < -int(area.frameHeight/2)))) {
				if (!(FlxCollision.pixelPerfectCheck(this, ship))) {
					FlxVelocity.moveTowardsPoint(ship, dist, ship.speed);
				}*/

		}
	}

}