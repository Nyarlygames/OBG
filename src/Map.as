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
		public var maxScore:int = 0;
		public var id:int = 0;
		public var bg:String = new String("");
		public var borders:String = new String("");
		public var switches:Array = new Array();
		
		// Crée le groupe d'ennemis à partir d'un fichier
		
		/* FORMAT :
			 * ID STAGE
			 * MAXSCORE
			 * BACKGROUND PICTURE
			 * BORDER PIC
			 * NB TRANSITION SCROLLING
			 * TRANSITION : X Y VX VY
			 * TYPEENNEMIS VIE X Y SCORE
			 * BOSS
			 * ...
		 * */
		public function Map(map:Class, player:Ship) 
		{
			var fileContent:String = new map();
			var lignes:Array = fileContent.split('\n');
			var en:Array;
			if (lignes != null) {
				id = lignes[0];
				maxScore = lignes[1];
				bg = lignes[2];
				borders = lignes[3];
				for (var x:int = 0; x < lignes[4]; x++) {
					switches.push(lignes[5 + x].split(' '));
				}
			}
			switches.reverse();
			for (var i:int = 5+x;  i < lignes.length; i++) {
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