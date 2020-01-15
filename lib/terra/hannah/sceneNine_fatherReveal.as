package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import lib.terra.ProgressManager;
	
	public class sceneNine_fatherReveal extends MovieClip {

		public function sceneNine_fatherReveal() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			this.addEventListener(TouchEvent.TOUCH_TAP, ontoNextScene);
		}
		
		private function ontoNextScene(event:TouchEvent)
		{
			var badEnding:Boolean = ProgressManager.hasTakenVillagePowerCore || ProgressManager.hasTakenDamPowerCore;
			
			this.parent.addChild(badEnding ? new sceneNine_badEnding2() : new sceneNine_goodEnding2());
			this.parent.removeChild(this);
		}
	}
}
