package  
{
	import org.flixel.FlxGame;

	[SWF(width = "1024", height = "768", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	/**
	 * Démarrage
	 * @author 
	 */
	public class OBG extends FlxGame
	{
		[Embed(source = "../options.cfg", mimeType = "application/octet-stream")] public var configs:Class;
		public var config:Configs = new Configs(configs);
		
		public function OBG()
		{
		
			super(config.width, config.height, MenuState);
		}
	}

}