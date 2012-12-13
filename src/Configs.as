package  
{
	
	/**
	 * Configurations
	 * @author ...
	 */
	public class Configs
	{
		[Embed(source = "../options.cfg", mimeType = "application/octet-stream")] public var configs:Class;
		public var width:int = 1024;
		public var height:int = 768;
		public var name:String;
		
		public function Configs() 
		{
			var fileContent:String = new configs();
			var lignes:Array = fileContent.split('\n');
			width = lignes[0];
			height = lignes[1];
			name = lignes[2];
		}
		
	}

}