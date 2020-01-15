package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_goodEnding4;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_goodEnding3 extends MovieClip {

		public function sceneNine_goodEnding3() 
		{
			
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			//this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			//I'll have to set a delay...
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|Animals as far as the eye could see. The sun like a warm, friendly face.",
							       "FATHER|Trees dotting the mountains like a declaration that life won't be stopped."]);
				dialogBox.name = "DIALOGBOX";
			
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
				
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				
				this.addChild(dialogBox);
			
		}
		
		public function dialogBoxFinished(event:DialogBoxEvent)
		{
			var newScene:sceneNine_goodEnding4 = new sceneNine_goodEnding4();
			this.parent.addChild(newScene);
			this.parent.removeChild(this);
		}

	}
	
}
