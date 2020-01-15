package lib.terra.ui {
	
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import lib.terra.AudioManager;
	
	
	public class scene1 extends MovieClip {
		
		
		public function scene1() {
			// constructor code
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
		}
		
		private function onTouchBegin(evt:TouchEvent): void {
			
			this.play();
		}
		
		private function onTouchEnd(evt:TouchEvent): void {
			
			this.stop();
		}
	}
	
}
