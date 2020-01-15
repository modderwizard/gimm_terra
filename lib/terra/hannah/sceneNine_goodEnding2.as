package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_goodEnding3;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_goodEnding2 extends MovieClip {

		public function sceneNine_goodEnding2() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		public function onEnterFrame(event:Event)
		{
			if(this.currentFrame == 25)
			{
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|You know, they say that this world used to thrive.",
									"FATHER|That this world was a sight to be reckoned with."]);
				dialogBox.name = "DIALOGBOX";
				
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
				
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				
				this.addChild(dialogBox);
			}
		}
		
		private function dialogBoxFinished(event:DialogBoxEvent)
		{
			var newScene:sceneNine_goodEnding3 = new sceneNine_goodEnding3();
			this.parent.addChild(newScene);
			this.parent.removeChild(this);
		}

	}
	
}
