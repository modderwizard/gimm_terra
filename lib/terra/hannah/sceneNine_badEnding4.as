package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_badEnding5;
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_badEnding4 extends MovieClip {
		
		
		public function sceneNine_badEnding4() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|But humans are naturally selfish.", 
								    "FATHER|And their selfish acts and ignorant minds tortured this world with pollution and hate until it could take no more. ", 
			                        "FATHER|If only we could've realized it before it was too late."]);
				dialogBox.name = "DIALOGBOX";
			
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
			
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				//dialogBox.setNoPortrait();
				this.addChild(dialogBox);
			

			
			//this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		public function dialogBoxFinished(event:DialogBoxEvent)
		{
			var _sceneFork:sceneNine_badEnding5 = new sceneNine_badEnding5();
			this.parent.addChild(_sceneFork);
			this.parent.removeChild(this);

		}
		
		

	}
	
}
