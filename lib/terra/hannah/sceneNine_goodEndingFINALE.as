package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_goodEndingFINALE extends MovieClip {

		public function sceneNine_goodEndingFINALE() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|There aren't enough words to thank you.", 
								   "FATHER|Or at least, none that I know.", 
								   "FATHER|But let me show you how grateful I am to you. ",
								   "FATHER|...",
								   "FATHER|Come."]);
				dialogBox.name = "DIALOGBOX";
			
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				//dialogBox.setNoPortrait();
				this.addChild(dialogBox);
		}

		private function dialogBoxFinished(evt:DialogBoxEvent)
		{
			this.play();
		}
		
	}
	
}
