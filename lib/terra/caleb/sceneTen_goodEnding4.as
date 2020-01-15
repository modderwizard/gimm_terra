package lib.terra.caleb 
{
	import flash.display.MovieClip;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	import flash.events.TouchEvent;
	
	import lib.terra.AudioManager;
	import lib.terra.ui.DialogBox;
	import lib.terra.ui.DialogBoxEvent;
	
	
	public class sceneTen_goodEnding4 extends MovieClip 
	{
		
			public function sceneTen_goodEnding4()
			{
				var dialogbox:DialogBox = new DialogBox();
				dialogbox.setData(["FATHER|Now connect the power cable to the generator."]);
				this.addChild(dialogbox);
				dialogbox.addEventListener(DialogBoxEvent.FINISHED, ondialog);
			}
			
		private function ondialog(evt:DialogBoxEvent):void
		{
			this.play();
		}
	 }
}
