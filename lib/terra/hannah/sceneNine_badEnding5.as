package lib.terra.hannah  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_badEnding6;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_badEnding5 extends MovieClip{

		public function sceneNine_badEnding5() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|But maybe there was no hope.",
									"FATHER|Maybe the line between good and evil is more grey than we thought...",
									"FATHER|Better explained simply as human nature instead of two separate acts.",
									"FATHER|For you, you are not from this world and yet you display the same characteristics as us.", 
			                        "FATHER|Selfish. Ignorant. Concerned only with your own progress."]);
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
			var _nextScene:sceneNine_badEnding6 = new sceneNine_badEnding6();
			this.parent.addChild(_nextScene);
			this.parent.removeChild(this);
		}

	}
	
}
