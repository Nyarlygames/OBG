package  
{
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import flash.system.System;
	
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
			if ((FlxG.keys.pressed("LEFT")) || (FlxG.keys.pressed("Q"))) {
				player.angle -= spinspeed;
			}
			if ((FlxG.keys.pressed("RIGHT")) || (FlxG.keys.pressed("D"))) {
				player.angle += spinspeed;
			}
			if (FlxG.keys.pressed("ESCAPE"))
				System.exit(0);
				
			// A VIRER
			if (FlxG.keys.pressed("SPACE"))
				FlxG.switchState(new Game());	
		}
		
	}

}