package lib.terra.caleb 
{
	
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	
	import lib.terra.AudioManager;
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	public class sceneTen_goodEnding5 extends MovieClip 
	{
		
		
		public function sceneTen_goodEnding5()
			{
				var dialogbox:DialogBox = new DialogBox();
				dialogbox.setData(["FATHER|Great! Now connect the cable to the rocket."]);
				this.addChild(dialogbox);
				dialogbox.addEventListener(DialogBoxEvent.FINISHED, ondialog);
			}
			
		private function ondialog(evt:DialogBoxEvent):void
		{
			this.play();
		}
	}
	
}
