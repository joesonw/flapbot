package 
{
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Qiaosen Huang
	 */
	public class Script {
		private var _xml:XML
		private var _lines:Vector.<ScriptNode>
		private var _objects:Vector.<Object>
		public function Script() {
			_lines = new Vector.<ScriptNode>()
			_objects = new Vector.<Object>()
		}
		public function load(name:String):void {
			var _ul:URLLoader = new URLLoader()
			_ul.addEventListener(Event.COMPLETE, _loadedAnalyze)
			_ul.load(new URLRequest(name))
		}
		private function _loadedAnalyze(e:Event):void {
			_xml = XML(e.target.data)
			if (!_xml.name() == "script") {
				//error
			}
			if (!_xml.@version == "1.0") {
				//error
			}
		}
		
		public function run():void {
			
		}
	}

}