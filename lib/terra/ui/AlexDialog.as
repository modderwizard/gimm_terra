package  lib.terra.ui{
	
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	import lib.terra.AudioManager;
	
	
	public class AlexDialog extends MovieClip {

		public function AlexDialog() {
			// constructor code
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouchBegin);
			addEventListener(TouchEvent.TOUCH_END, onTouchEnd);
		}
		
		private function onTouchBegin(evt:TouchEvent): void {
			
			this.alien.play();
			this.play();
		}
		
		private function onTouchEnd(evt:TouchEvent): void {
			
			this.alien.stop();
			this.stop();
		}
		
		private function openDialog(): void {
			var dialogbox:DialogBox = new DialogBox();
			dialogbox.setData(["DEFAULT|It seems that you are out fuel and your power reserves are low to leave the planet.","DEFAULT|There will be opportunities to gain your reserves back."]);
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

			var mcc:Scene5 = new Scene5();
			mcc.width *= 0.625;
			mcc.height *= 0.625;
			
			parent.addChild(mcc);
			parent.removeChild(this);
			
		}
		

	}
	
}
