package  lib.terra.ui{
	
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import lib.terra.AudioManager;
	
	
	public class Scene5 extends MovieClip {

		public function Scene5() {
			// constructor code
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
		}
		
		private function onTouchBegin(evt:TouchEvent): void {
			
		
		}
		
		private function onTouchEnd(evt:TouchEvent): void {
			

		}
		
		public function openDialog(): void {
			var dialogbox:DialogBox = new DialogBox();
			dialogbox.setData(["DEFAULT|There seems to be power reserves nearby. They are marked on your radar. Good luck."]);
			dialogbox.setNoPortrait();
			this.addChild(dialogbox);
			dialogbox.addEventListener(DialogBoxEvent.FINISHED, ondialog);
			
			// Merge edit by Jonathan: Fix dialog box size caused by another fix
			dialogbox.width /= 0.625;
			dialogbox.height /= 0.625;
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
		}
		
		private function ondialog(evt:DialogBoxEvent): void {
			
			stop();
			parent.addChild(new PanelOverview());
			parent.removeChild(this);
			
		}
		

	}
	
}