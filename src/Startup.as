package  
{
	import starling.core.Starling;
	import flash.display.Sprite
	/**
	 * ...
	 * @author Qiaosen Huang
	 */
	public class Startup extends Sprite
	{
		private var _starling:Starling
		public function Startup() 
		{
			_starling = new Starling(Main, stage)
			_starling.start()
		}
		
	}

}