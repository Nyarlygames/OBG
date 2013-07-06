package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxSound;
	import com.greensock.*;
	import com.greensock.events.TweenEvent;
	import com.greensock.easing.*;
	
	/**
	 * Ennemis
	 * @author ...
	 */
	
	public class Ennemis extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/arrowright.png')] public var ImgArrowRIGHT:Class;
		[Embed(source = '../assets/gfx/arrowleft.png')] public var ImgArrowLEFT:Class;
		[Embed(source = '../assets/gfx/arrowup.png')] public var ImgArrowUP:Class;
		[Embed(source = '../assets/gfx/arrowdown.png')] public var ImgArrowDOWN:Class;
		public var to:FlxPoint;
		public var pv:FlxBar;
		public var maxtir:int = 20;
		public var shoot:FlxWeapon;
		public var sound:FlxSound;
		public var player:Ship;
		public var dmg:int = 1;
		public var score:int = 0;
		public var tw:TweenMax;
		public var arrow:Arrows;

		
		public function Ennemis(x:int, y:int, ImgType:Class, vie:int, ship:Ship, move:FlxPoint) 
		{
			sound = new FlxSound();
			sound.loadStream("../assets/sfx/mort.mp3", false, true);
			player = ship;
			super(x, y, ImgType);
			immovable = true;
			health = vie;
			pv = new FlxBar(16, 64, FlxBar.FILL_LEFT_TO_RIGHT, 64, 4, this, "health",0 ,health);
			pv.trackParent(0, -10);
			shoot = new FlxWeapon("shoot", this, "x", "y");
			shoot.setBulletLifeSpan(2000);
			switch (move.x) {
					case -50:
						arrow = new Arrows(x, y + 60, ImgArrowLEFT);
						break;
					case 50:
						arrow = new Arrows(x, y + 60, ImgArrowRIGHT);
						break;
			}
			switch (move.y) {
					case -50:
						arrow = new Arrows(x, y + 60, ImgArrowUP);
						break;
					case 50:
						arrow = new Arrows(x, y + 60, ImgArrowDOWN);
						break;
			}
			FlxG.state.add(arrow);
		}
		
		override public function update():void {
			
		}
		
		// Mort du vaisseau
		public function mort():FlxSprite {
			if (health == 0) {
				pv.exists = false;
				this.exists = false;
				arrow.exists = false;
				FlxG.state.remove(arrow);
			}
			return(null);
		}
	}

}