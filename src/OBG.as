package  
{
	import org.flixel.FlxGame;

	[SWF(width = "1024", height = "768", backgroundColor = "#000000")]
	 [Frame(factoryClass="Preloader")]
	
	/**
	 * Starting point of the game application
	 * @author 
	 */
	public class OBG extends FlxGame
	{
		public function OBG()
		{
			//Function to call to create the game at a specified screen size and display the first state (MenuState)
			super(1024, 768, MenuState);
		}
		
	}

}