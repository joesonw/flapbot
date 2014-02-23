package 
{
	import starling.display.Sprite
	import starling.events.Event
	/**
	 * ...
	 * @author Qiaosen Huang
	 */
	public class Main extends Sprite 
	{
		private var _g:Engine;
		private var _s:Script;
		public function Main():void 
		{
			//_g = new Engine(this, 810, 600, 5);
			//_g.draw()
			/*addEventListener(Event.ENTER_FRAME, function(e:Event) {
				_g.draw()
			})*/
			_s = new Script()
			_s.load("script.xml")
			_s.run()
		}
		
	}
	
}