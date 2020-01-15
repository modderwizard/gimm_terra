package lib.terra.hannah {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_badEndingFINALE;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_badEnding6 extends MovieClip {

		public function sceneNine_badEnding6() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|That core you hold in your hands was the only power stopping the seas from destroying the village below.", 
								   "FATHER|I'm not going to ask whether you understood the consequence before you stole it,",
								   "FATHER|but rather hope you know that with each action, there is always a reaction."]);
				dialogBox.name = "DIALOGBOX";
			
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				//dialogBox.setNoPortrait();
				this.addChild(dialogBox);
		}
		
		public function dialogBoxFinished(event:DialogBoxEvent)
		{
			var newScene:sceneNine_badEndingFINALE = new sceneNine_badEndingFINALE();
			this.parent.addChild(newScene);
			this.parent.removeChild(this);
		}

	}
	
}
