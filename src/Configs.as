package  
{
	
	/**
	 * Configurations
	 * @author ...
	 */
	public class Configs
	{
		public var width:int = 1024;
		public var height:int = 768;
		
		public function Configs(config:Class) 
		{
			var fileContent:String = new config();
			var lignes:Array = fileContent.split('\n');
			width = lignes[0];
			height = lignes[1];
		}
		
	}

}