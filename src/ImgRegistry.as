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
		public var assets:Array = new Array();
		
		public function ImgRegistry() 
		{
			assets.push(ImgQuit);
			assets.push(ImgQuite);
			assets.push(ImgOpts);
			assets.push(ImgOptse);
			assets.push(ImgStart);
			assets.push(ImgStarte);
		}
	}

}