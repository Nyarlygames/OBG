package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxBar;
	
	/**
	 * Ship
	 * @author ...
	 */
	public class Ship extends FlxSprite 
	{
		[Embed(source = '../assets/gfx/ship.png')] public var ImgShip:Class;
		public var to:FlxPoint = new FlxPoint();
		public var tirs:FlxGroup;
		public var maxtir:int = 250;
		public var pv:FlxBar;
		public var life:int = 3;
		
		public function Ship() 
		{
			super(FlxG.width / 2, 100, ImgShip);
			immovable = true;
			tirs = new FlxGroup();
			health = 100;
			pv = new FlxBar(16, 64, FlxBar.FILL_LEFT_TO_RIGHT, 64, 4, this, "health");
			pv.trackParent(0, -30);
			exists = true;
		}
		
		public function moveship(area:Area, cur:Cursor):void {
			// Vaisseau bouge vers curseur
			to.x = FlxG.mouse.x - (this.x + this.frameWidth/2);
			to.y = FlxG.mouse.y - (this.y + this.frameHeight / 2);
			if (((int(to.x) > int(area.frameWidth/2)) || (int(to.y) > int(area.frameHeight/2))) || (
				(int(to.x) < -int(area.frameWidth/2)) || (int(to.y) < -int(area.frameHeight/2)))) {
					FlxVelocity.moveTowardsMouse(this,2*FlxVelocity.distanceToMouse(this));
					
					}
			else if	(FlxCollision.pixelPerfectCheck(area, cur)) {
				this.velocity.x = 0;
				this.velocity.y = 0;
			}
		}
		
		
		// Gestion des balles pour performances
		public function recycletirs(cur:Cursor):void {
			for each (var tir:Tir in tirs.members) {
				if ((tir != null) && ((tir.x > FlxG.width) || (tir.y > FlxG.height) || 
						(tir.x < 0) || (tir.y < 0))) {
						tir.exists = false;
				}
			}
			if (tirs.length < maxtir) {
				var newtir:Tir = new Tir(this, cur);
				tirs.add(newtir);
			}
			else {
				var recycle:Tir =  tirs.getFirstAvailable() as Tir;
				if (recycle != null)
					recycle.updatetir(this, cur);
			}
		}
		
		public function mort():void {
			if ((health == 0) && (life == 0)){
				exists = false;
				pv.exists = false;
			}
			else if (health == 0) {
				health = 100;
				exists = true;
				pv.exists = true;
				life--;
			}
		}
	}

}