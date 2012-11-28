package  
{
	import org.flixel.FlxGroup;
	
	/**
	 * Maps
	 * @author ...
	 */
	public class Map 
	{
		
		public var ens:FlxGroup = new FlxGroup();
		
		// Crée le groupe d'ennemis à partir d'un fichier
		
		/* FORMAT :
			 * ID STAGE
			 * MAXSCORE
			 * BACKGROUND PICTURE
			 * TYPEENNEMIS VIE X Y
			 * BOSS
			 * ...
		 * */
		public function Map(map:Class, player:Ship) 
		{
			var fileContent:String = new map();
			var lignes:Array = fileContent.split('\n');
			var en:Array;
			if (lignes != null) 
				var maxScore:int = lignes[0];
			for (var i:int = 1;  i < lignes.length; i++) {
				if (lignes[i] != null)
					en = lignes[i].split('/');
					if (en != null) {
						switch(en[0]){
							case "Classic":
								ens.add(new Classique(en[1], en[2], en[3], en[4], player));
							break;
							case "Bomber":
								ens.add(new Bomber(en[1], en[2], en[3], en[4], player));
							break;
							default:
								ens.add(new Classique(en[1], en[2], en[3], en[4], player));
						}
					}
			}
		}
		
	}

}