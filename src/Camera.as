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
	 * Camera
	 * @author ...
	 */
	public class Camera extends FlxSprite
	{
		
		[Embed(source = '../assets/gfx/aids.png')] public var ImgAids:Class;
		[Embed(source = '../assets/gfx/tir4.png')] public var ImgShoot:Class;
		[Embed(source = "../assets/gfx/explode.png")] private var Explode:Class;
		public var ship:Ship;
		public var sound:FlxSound;
		
		public function Camera(xpos:int, ypos:int, player:Ship) 
		{
			x = xpos;
			y = ypos;
			super(x, y);
			sound = new FlxSound();
			visible = false;
			//velocity.y = 50;
			ship = player;
			FlxG.state.add(this);
		}
		
		override public function update():void {
			
		}
		
	}

}