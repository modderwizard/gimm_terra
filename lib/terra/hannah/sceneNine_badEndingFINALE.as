package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_badEndingFINALE extends MovieClip {

		public function sceneNine_badEndingFINALE() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|We met but for a brief moment. And yes, I refused to help you for my own selfish reasons.", 
								   "FATHER|However, my selfish reasons didn't destroy a village. Didn't send waves upon waves of roaring water upon the helpless.", 
								   "FATHER|Unfortunately for you, one of those helpless beings was someone very important to me.",
								   "FATHER|...",
								   "FATHER|Perhaps, the only thing important to me...",
								   "FATHER|My son. And you killed him."]);
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
			this.gotoAndPlay(160);
		}

	}
	
}
