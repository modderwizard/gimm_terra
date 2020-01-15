package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_goodEnding6;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_goodEnding5 extends MovieClip {

		public function sceneNine_goodEnding5() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|We met but for a brief moment some time ago. And yes, I myself refused to help you for my own selfish reasons.",
									"FATHER|But I was intrigued, and I followed you, cloaked in shadow.",
									"FATHER|I watched, as you were presented time and time again with the very power you need to leave this place...",
									"FATHER|And yet you chose to carry on."]);
				dialogBox.name = "DIALOGBOX";
			
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
			
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				//dialogBox.setNoPortrait();
				this.addChild(dialogBox);
		}
		
		private function dialogBoxFinished(event:DialogBoxEvent)
		{
			var _nextScene:sceneNine_goodEnding6 = new sceneNine_goodEnding6();
			this.parent.addChild(_nextScene);
			this.parent.removeChild(this);
		}

	}
	
}
