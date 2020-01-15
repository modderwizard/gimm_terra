package lib.terra.caleb 
{
	import flash.events.TouchEvent;
	import flash.display.MovieClip;
	
	
	public class sceneTen_goodEnding7 extends MovieClip 
	{
		public function sceneTen_goodEnding7() 
		{
			// constructor code
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
		}
		
		private function onTouchBegin(evt:TouchEvent): void 
		{
			
			this.play();
		}
		
		private function onTouchEnd(evt:TouchEvent): void 
		{
			
			this.stop();
		}
	}
}
