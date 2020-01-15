package lib.terra.hannah {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_goodEndingFINALE;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_goodEnding6 extends MovieClip {

		public function sceneNine_goodEnding6() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["FATHER|You left the absolute certainty of getting the source that would serve your goal and yet, you didn't take it.", 
								   "FATHER|But why? Is there hope after all that something bigger still exists?",
								   "FATHER|Something more powerful than that urge to survive that often wins out over everything else?",
								   "FATHER|And after this world is gone, destroyed by a race that refused to realize that there are things much bigger than us?"]);
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
			var newScene:sceneNine_goodEndingFINALE = new sceneNine_goodEndingFINALE();
			this.parent.addChild(newScene);
			this.parent.removeChild(this);
		}

	}
	
}
