package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.GraphicsBitmapFill;
	import flash.display.MovieClip;
	import flash.display.SpreadMethod;
	import starling.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import starling.textures.Texture
	import starling.display.Image;
	/**
	 * ...
	 * @author Qiaosen Huang
	 */
	public class Engine 
	{
		private var _container:Sprite
		private var _content:Image
		private var prevFrame:BitmapData
		private var currFrame:BitmapData
		private var nextFrame:BitmapData
		private var currX:Number
		private var _width:int
		private var _height:int
		private var counter:int
		private var _deltaX:Number // movement of x per draw
		public function Engine(_o:Sprite,width:int,height:int,deltaX:Number) 
		{
			_container = _o
			_width = width
			_height = height
			_deltaX=deltaX
			prevFrame = new BitmapData(_width,_height)
			currFrame = new BitmapData(_width,_height)
			nextFrame = new BitmapData(_width,_height)
			currX = 0
			counter=1
			init()
		}
		
		private function init():void {
			prevFrame=genFrame()
			currFrame=genFrame()
			nextFrame = genFrame()
			_container.addChildAt(new Image(Texture.fromBitmapData(prevFrame)),0)
		}
		private function genFrame():BitmapData {
			var s:flash.display.Sprite = new flash.display.Sprite()
			s.width = _width
			s.height=_height
			var result:BitmapData=new BitmapData(_width,_height)
			var h1:int = Math.floor(Math.random() * 360 + 20)
			var h2:int = Math.floor(Math.random() * 360 + 20)
			var h3:int = Math.floor(Math.random() * 360 + 20)
			//s.graphics.beginFill(0x4BE846)
			var m:Matrix = new Matrix()
			
			m.createGradientBox(50, _height, 0, 110, 0)
			
			s.graphics.lineStyle(3, 0x152324)
			s.graphics.beginGradientFill(GradientType.LINEAR, [0x22A11D, 0xA9DE43,0xA9DE43, 0x22A11D], [1, 1, 1,1], [0, 100,145, 255], m,SpreadMethod.PAD)
			s.graphics.drawRect(110, 0, 50, h1-20)
			s.graphics.drawRect(110, h1 + 220, 50, 380 - h1)
			s.graphics.endFill()
			m = new Matrix()
			m.createGradientBox(60, 20, 0, 105, 0)
			s.graphics.beginGradientFill(GradientType.LINEAR, [0x22A11D, 0xA9DE43,0xA9DE43, 0x22A11D], [1, 1, 1,1], [0, 100,145, 255], m,SpreadMethod.PAD)
			s.graphics.drawRect(105, h1-20, 60, 20)
			s.graphics.drawRect(105, h1 + 200, 60, 20)
			s.graphics.endFill()
			
			
			m = new Matrix()
			m.createGradientBox(50, _height, 0, 380, 0)
			s.graphics.beginGradientFill(GradientType.LINEAR, [0x22A11D, 0xA9DE43,0xA9DE43, 0x22A11D], [1, 1, 1,1], [0, 100,145, 255], m,SpreadMethod.PAD)
			s.graphics.drawRect(380, 0, 50, h2 - 20)
			s.graphics.drawRect(380, h2 + 220, 50, 380 - h2)
			s.graphics.endFill()
			m = new Matrix()
			m.createGradientBox(60, 20, 0, 375, 0)
			s.graphics.beginGradientFill(GradientType.LINEAR, [0x22A11D, 0xA9DE43,0xA9DE43, 0x22A11D], [1, 1, 1,1], [0, 100,145, 255], m,SpreadMethod.PAD)
			s.graphics.drawRect(375, h2 - 20, 60, 20)
			s.graphics.drawRect(375, h2 + 200, 60, 20)
			s.graphics.endFill()
			
			
			m = new Matrix()
			m.createGradientBox(50, _height, 0, 650, 0)
			s.graphics.beginGradientFill(GradientType.LINEAR, [0x22A11D, 0xA9DE43,0xA9DE43, 0x22A11D], [1, 1, 1,1], [0, 100,145, 255], m,SpreadMethod.PAD)
			s.graphics.drawRect(650, 0, 50, h3 - 20)
			s.graphics.drawRect(650, h3 + 220, 50, 380 - h3)
			s.graphics.endFill()
			m = new Matrix()
			m.createGradientBox(60, 20, 0, 645, 0)
			s.graphics.beginGradientFill(GradientType.LINEAR, [0x22A11D, 0xA9DE43,0xA9DE43, 0x22A11D], [1, 1, 1,1], [0, 100,145, 255], m,SpreadMethod.PAD)
			s.graphics.drawRect(645, h3 - 20, 60, 20)
			s.graphics.drawRect(645, h3  + 200, 60, 20)
			s.graphics.endFill()
			
			var t1:TextField = new TextField()
			var t2:TextField = new TextField()
			var t3:TextField = new TextField()
			t1.text = counter.toString()
			t1.width = 50
			t1.height = 20
			t1.y = 10
			t1.x = 110
			t1.textColor=0xffffff
			counter++
			t2.text = counter.toString()
			t2.width = 50
			t2.height = 20
			t2.y = 10
			t2.x = 380
			
			t2.textColor=0xffffff
			counter++
			t3.text = counter.toString()
			t3.width = 50
			t3.height = 20
			t3.y = 10
			t3.x = 650
			t3.textColor=0xffffff
			counter++
			
			s.addChild(t1)
			s.addChild(t2)
			s.addChild(t3)
			result.draw(s)
			return result
		}
		public function draw():void {
			_container.removeChildAt(0)
			var b:BitmapData=new BitmapData(_width,_height)
			if (currX >= _width) {
				prevFrame=currFrame
				currFrame=nextFrame
				nextFrame=genFrame()
				currX -= _width
			}
			if (currX == 0) {
				b.copyPixels(prevFrame,new Rectangle(0,0,_width,_height),new Point(0,0))
			} else {
				
				b.copyPixels(prevFrame, new Rectangle(currX, 0, _width - currX, _height), new Point(0, 0))
				b.copyPixels(currFrame,new Rectangle(0,0,currX,_height),new Point(_width-currX,0))
			}
			_container.addChildAt(new Image(Texture.fromBitmapData(b)),0)
			currX+=_deltaX
		}
	}

}