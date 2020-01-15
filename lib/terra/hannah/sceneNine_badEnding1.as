package lib.terra.hannah  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TouchEvent;
	
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	//import lib.sceneNine_fatherReveal;
	
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneNine_badEnding1 extends MovieClip {

		public function sceneNine_badEnding1() 
		{
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		public function onEnterFrame(event:Event)
		{
			if(this.currentFrame == 167)
			{
				this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				var dialogBox:DialogBox = new DialogBox();
				//dialogBox.setData(["DEFAULT|• (You take the power core)"]);
				dialogBox.setData(["STRANGER|You've come a long way..."]);
				dialogBox.name = "DIALOGBOX";
				
				dialogBox.scaleX = 0.65;
				dialogBox.scaleY = 0.65;
				dialogBox.y = 150;
				dialogBox.x = 160;
				
				dialogBox.addEventListener(DialogBoxEvent.FINISHED, dialogBoxFinished);
				
				dialogBox.setNoPortrait();
				
				this.addChild(dialogBox);
			}
		}
		
		public function dialogBoxFinished(event:DialogBoxEvent)
		{
			var newScene:sceneNine_fatherReveal = new sceneNine_fatherReveal();
			this.parent.addChild(newScene);
			this.parent.removeChild(this);
		}

	}
	
}
