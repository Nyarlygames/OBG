package  
{

	import org.flixel.FlxObject;

	/**
	 * ...
	 * @author ...
	 */
	public class ImgRegistry extends FlxObject 
	{
		
		
		[Embed(source = '../assets/gfx/quitter.png')] public var ImgQuit:Class;
		[Embed(source = '../assets/gfx/options.png')] public var ImgOpts:Class;
		[Embed(source = '../assets/gfx/demarrer.png')] public var ImgStart:Class;
		[Embed(source = '../assets/gfx/quittere.png')] public var ImgQuite:Class;
		[Embed(source = '../assets/gfx/optionse.png')] public var ImgOptse:Class;
		[Embed(source = '../assets/gfx/demarrere.png')] public var ImgStarte:Class;
		[Embed(source = '../assets/gfx/adn1.png')] public var ImgAdn1:Class;
		[Embed(source = '../assets/gfx/adn2.png')] public var ImgAdn2:Class;
		[Embed(source = '../assets/gfx/adn3.png')] public var ImgAdn3:Class;
		[Embed(source = '../assets/gfx/adn4.png')] public var ImgAdn4:Class;
		public var assets:Array = new Array();
		public var adncount:int = 4;
		public var adnindex:int = 6;
		
		public function ImgRegistry() 
		{
			assets.push(ImgQuit);
			assets.push(ImgQuite);
			assets.push(ImgOpts);
			assets.push(ImgOptse);
			assets.push(ImgStart);
			assets.push(ImgStarte);
			assets.push(ImgAdn1);
			assets.push(ImgAdn2);
			assets.push(ImgAdn3);
			assets.push(ImgAdn4);
		}
	}

}