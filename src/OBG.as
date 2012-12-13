package  
{
	import org.flixel.FlxGame;
	
	[SWF(width = "800", height = "600", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	/**
	 * Démarrage
	 * @author 
	 */
	public class OBG extends FlxGame
	{
		public var config:Configs = new Configs();
		
		public function OBG()
		{
			super(config.width, config.height, Menu);
		}
	}

}