package  
{
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author ...
	 */
	public class KeyEvent extends FlxBasic
	{
		public var player:Ship;
		public var spinspeed:int = 3;
		
		public function KeyEvent(ship:Ship) 
		{
			player = ship;
		}
		
		override public function update():void {
			if (FlxG.keys.pressed("LEFT")) {
				player.angle -= spinspeed;
			}
			if (FlxG.keys.pressed("RIGHT")) {
				player.angle += spinspeed;
			}
		}
		
	}

}