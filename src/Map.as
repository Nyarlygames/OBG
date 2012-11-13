package  
{
	
	/**
	 * Maps
	 * @author ...
	 */
	public class Map 
	{
		
		public function Map() 
		{
			[Embed(source = "../maps/map01.txt", mimeType = "application/octet-stream")] var testFile:Class;
			var fileContent:String = new testFile();
			var result:Array = fileContent.split('\n');
			
		}
		
	}

}